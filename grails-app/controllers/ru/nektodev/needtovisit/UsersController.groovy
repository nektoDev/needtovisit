package ru.nektodev.needtovisit

import grails.plugins.springsecurity.Secured
import needtovisit.PlaceService
import org.springframework.dao.DataIntegrityViolationException

class UsersController {

    def userService

    def placeService

    def placeListsService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usersInstanceList: Users.list(params), usersInstanceTotal: Users.count()]
    }

    def create() {
        [usersInstance: new Users(params)]
    }

    def save() {
        def usersInstance = new Users(params)
        usersInstance.enabled = true;
        if (!usersInstance.save(flush: true)) {
            render(view: "create", model: [usersInstance: usersInstance])
            return
        }

        flash.message = message(code: 'user.registred.message', args: [usersInstance.username])
        redirect(controller: "index")
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show(Long id) {
        def usersInstance = Users.get(id)
        if (id.equals((springSecurityService.getCurrentUser() as Users).id as Long)) {
            redirect(action: "edit", id: id)
        }
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
            return
        }
        Closure refresh = {placeService.getPlacesList(usersInstance)}
        placeListsService.setPlaces(refresh)
        [usersInstance: usersInstance, places: placeListsService.getPlaces()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def edit(Long id) {
        if (!id.equals((springSecurityService.getCurrentUser() as Users).id as Long)) {
            redirect(action: "show", id: id)
        }

        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
            return
        }

        [usersInstance: usersInstance]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def update(Long id, Long version) {
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usersInstance.version > version) {
                usersInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'users.label', default: 'Users')] as Object[],
                        "Another user has updated this Users while you were editing")
                render(view: "edit", model: [usersInstance: usersInstance])
                return
            }
        }

        usersInstance.properties = params

        if (!usersInstance.save(flush: true)) {
            render(view: "edit", model: [usersInstance: usersInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'users.label', default: 'Users'), usersInstance.id])
        redirect(action: "show", id: usersInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def usersInstance = Users.get(id)
        if (!usersInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
            return
        }

        try {
            usersInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'users.label', default: 'Users'), id])
            redirect(action: "show", id: id)
        }
    }
}
