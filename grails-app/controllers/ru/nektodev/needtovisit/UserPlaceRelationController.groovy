package ru.nektodev.needtovisit

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import ru.nektodev.needtovisit.exceptions.NullIDException

class UserPlaceRelationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    def userPlaceRelationService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userPlaceRelationInstanceList: UserPlaceRelation.list(params), userPlaceRelationInstanceTotal: UserPlaceRelation.count()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def create() {
        [userPlaceRelationInstance: new UserPlaceRelation(params)]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def save() {
        def userPlaceRelationInstance  = new UserPlaceRelation(params)
        if (!userPlaceRelationInstance.save(flush: true, failOnError:true)) {
            render(view: "create", model: [userPlaceRelationInstance: userPlaceRelationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation'), userPlaceRelationInstance.id])
        redirect(action: "show", user: userPlaceRelationInstance.user, place: userPlaceRelationInstance.place)
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show(Users user, Place place) {
        def userPlaceRelationInstance = UserPlaceRelation.findByUserAndPlace(user, place)
        if (!userPlaceRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation'), user])
            redirect(action: "list")
            return
        }

        [userPlaceRelationInstance: userPlaceRelationInstance]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def edit(Long id) {
        def userPlaceRelationInstance = UserPlaceRelation.get(id)
        if (!userPlaceRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation'), id])
            redirect(action: "list")
            return
        }

        [userPlaceRelationInstance: userPlaceRelationInstance]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def update(Long id, Long version) {
        def userPlaceRelationInstance = UserPlaceRelation.get(id)
        if (!userPlaceRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userPlaceRelationInstance.version > version) {
                userPlaceRelationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation')] as Object[],
                        "Another user has updated this UserPlaceRelation while you were editing")
                render(view: "edit", model: [userPlaceRelationInstance: userPlaceRelationInstance])
                return
            }
        }

        userPlaceRelationInstance.properties = params

        if (!userPlaceRelationInstance.save(flush: true)) {
            render(view: "edit", model: [userPlaceRelationInstance: userPlaceRelationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation'), userPlaceRelationInstance.id])
        redirect(action: "show", id: userPlaceRelationInstance.id)
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def delete(Long id) {
        def userPlaceRelationInstance = UserPlaceRelation.get(id)
        if (!userPlaceRelationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation'), id])
            redirect(action: "list")
            return
        }

        try {
            userPlaceRelationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation'), id])
            redirect(action: "show", id: id)
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def loadVisitedPopup(Long placeId) {
        Place p = Place.get(placeId)
        UserPlaceRelation result = UserPlaceRelation.findByUserAndPlace(springSecurityService.currentUser as Users, p)

        render(template: 'layouts/visitedPopup', model: [placeRel: result])
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def setVisitedAjax(Long placeId, Date visitedDate) {
        if (placeId != null) {
            Place p = Place.get(placeId)
            Users u = springSecurityService.currentUser as Users

            if (userPlaceRelationService.setVisited(p, u, visitedDate) != null) {
                render g.link([controller: 'place', action: 'show', id: p.id], p.name)
            }
        } else {
            throw new NullIDException("Place ID cannot be null")
        }


    }
}
