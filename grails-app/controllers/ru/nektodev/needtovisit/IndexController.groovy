package ru.nektodev.needtovisit

import grails.plugins.springsecurity.Secured
import ru.nektodev.needtovisit.exceptions.DatabaseSaveException

class IndexController {
    static scope = "session"

    def springSecurityService

    def placeListsService

    def userPlaceRelationService;

    def index() {
        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;
            return [placesList: placeListsService.getPlacesToVisitList(user, 10), placesVisited: placeListsService.getPlacesVisitedList(user, 10)]
        } else {
            return [placesList: placeListsService.getPlacesList(20)]
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def addUserPlaceRelation() {
        Users user = springSecurityService.currentUser as Users;
        def placeId = params.get("place") as String;

        if (userPlaceRelationService.save(placeId as Long, user) != null)
            render 'OK'
        else
            throw new DatabaseSaveException("Sorry. Something going wrong when we trying to save.")

    }

    def getPlacesRecommended() {
        render(template: '/place/layouts/placesRecommendedMin', model: ['places': placeListsService.getPlacesNewList(springSecurityService.currentUser as Users, 10)])
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def getPlacesToVisit() {
        render(template: '/place/layouts/placesToVisit', model: [places: placeListsService.getPlacesToVisitList(springSecurityService.currentUser as Users, 10)])
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def getPlacesVisited() {
        render(template: '/place/layouts/placesVisited', model: ['places': placeListsService.getPlacesVisitedList(springSecurityService.currentUser as Users, 10)])
    }
}
