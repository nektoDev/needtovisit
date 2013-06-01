package ru.nektodev.needtovisit

import org.springframework.dao.DataIntegrityViolationException

class PlaceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [placeInstanceList: Place.list(params), placeInstanceTotal: Place.count()]
    }

    def create() {
        [placeInstance: new Place(params)]
    }

    def save() {
        def placeInstance = new Place(params)

        if (!placeInstance.save(flush: true)) {
            render(view: "create", model: [placeInstance: placeInstance])
            return
        }
        UserPlaceRelation relationInstance = new UserPlaceRelation(user: springSecurityService.currentUser, place: placeInstance).save()
        placeInstance.addToUserRelation(relationInstance)
        placeInstance.save(flush: true)
        flash.message = message(code: 'default.created.message', args: [message(code: 'place.label', default: 'Place'), placeInstance.id])
        redirect(action: "show", id: placeInstance.id)
    }

    def show(Long id) {
        def placeInstance = Place.get(id)
        if (!placeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'place.label', default: 'Place'), id])
            redirect(action: "list")
            return
        }

        [placeInstance: placeInstance]
    }

    def edit(Long id) {
        def placeInstance = Place.get(id)
        if (!placeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'place.label', default: 'Place'), id])
            redirect(action: "list")
            return
        }

        [placeInstance: placeInstance]
    }

    def update(Long id, Long version) {
        def placeInstance = Place.get(id)
        if (!placeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'place.label', default: 'Place'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (placeInstance.version > version) {
                placeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'place.label', default: 'Place')] as Object[],
                          "Another user has updated this Place while you were editing")
                render(view: "edit", model: [placeInstance: placeInstance])
                return
            }
        }

        placeInstance.properties = params

        if (!placeInstance.save(flush: true)) {
            render(view: "edit", model: [placeInstance: placeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'place.label', default: 'Place'), placeInstance.id])
        redirect(action: "show", id: placeInstance.id)
    }

    def delete(Long id) {
        def placeInstance = Place.get(id)
        if (!placeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'place.label', default: 'Place'), id])
            redirect(action: "list")
            return
        }

        try {
            placeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'place.label', default: 'Place'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'place.label', default: 'Place'), id])
            redirect(action: "show", id: id)
        }
    }
}
