package ru.nektodev.needtovisit

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException
import ru.nektodev.needtovisit.exceptions.DatabaseSaveException

class PlaceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService

    def placeService

    def placeListsService

    def userPlaceRelationService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 50, 100)

        Closure refresh = {Place.list(params)};
        placeListsService.setPlaces(refresh);

        def result = placeListsService.getPlaces();

        [placeInstanceList: result, placeInstanceTotal: result.size()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def create() {
        [placeInstance: new Place(params)]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def save() {
        def placeInstance = new Place(params)

        if (placeService.save(placeInstance, springSecurityService.currentUser as Users) == null) {
            render(view: "create", model: [placeInstance: placeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'place.label', default: 'Place'), placeInstance.name])

        redirect(action: "show", id: placeInstance.id)
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def saveAjax() {
        def placeInstance = new Place(params)

        placeInstance = placeService.save(placeInstance, springSecurityService.currentUser as Users)
        if (placeInstance == null) {

            render placeInstance.name
            throw new DatabaseSaveException("Sorry. Something going wrong when we trying to saving to database.")
        }

        userPlaceRelationService.update(placeInstance.userRelation.find({ it.user.equals(springSecurityService.currentUser as Users) }), params);

        render g.link([controller: 'place', action: 'show', id: placeInstance.id], placeInstance.name)
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

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def edit(Long id) {
        def placeInstance = Place.get(id)
        if (!placeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'place.label', default: 'Place'), id])
            redirect(action: "list")
            return
        }

        [placeInstance: placeInstance]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
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

    @Secured(['IS_AUTHENTICATED_FULLY'])
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

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def search() {
        JSON.use('deep')
        def query = params.get('q') as String;
        def max = params.get('max') != null ? params.get('max') as Long : 10;
        render placeService.search(query, max) as JSON
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def notByUser(Integer max) {
        params.max = Math.min(max ?: 50, 100)

        Closure refresh = {placeService.getPlacesNotUserList(springSecurityService.currentUser as Users, params.max as Integer)}

        placeListsService.setPlaces(refresh);
        def result = placeListsService.getPlaces();

        [placeInstanceList: result, placeInstanceTotal: result.size()]
    }

}
