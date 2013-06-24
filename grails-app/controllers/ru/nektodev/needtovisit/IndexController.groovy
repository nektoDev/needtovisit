package ru.nektodev.needtovisit

import grails.plugins.springsecurity.Secured

class IndexController {
    static scope = "session"

    def springSecurityService

    def placeService

    def placeListsService

    def userPlaceRelationService;

    def index() {
        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;
            return [newPlaces: placeListsService.getPlacesNewList(user, 10), placesToVisit: placeListsService.getPlacesToVisitList(user, 10), placesVisited: placeListsService.getPlacesVisitedList(user, 10)]
        } else {
            return [newPlaces: placeListsService.getPlacesList(20)]
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def addUserPlaceRelation() {
        Users user = springSecurityService.currentUser as Users;
        def placeId = params.get("place") as String;

        if (userPlaceRelationService.save(placeId as Long, user) != null)
            render 'OK'
        else
            render 'BAD'
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def getNewPlaces() {
        render(template: '/place/layouts/newPlaces', model: ['places': placeListsService.getPlacesNewList(springSecurityService.currentUser as Users, 10)])
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
