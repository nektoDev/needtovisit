package ru.nektodev.needtovisit

import grails.plugins.springsecurity.Secured
import ru.nektodev.needtovisit.exceptions.DatabaseSaveException

class IndexController {
    static scope = "session"

    def springSecurityService

    def placeListsService

    def placeService

    def userPlaceRelationService;

    def index() {
        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;

            placeListsService.setPlaces(placeService.getPlacesList(user))
        } else {
            placeListsService.setPlaces(placeService.getPlacesList(20))

        }

        return [placesList: placeListsService.getPlaces()]
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
        render(template: '/place/layouts/placesRecommendedMin', model: ['places': placeService.getPlacesRecommendedList(springSecurityService.currentUser as Users, 7)])
    }

    def getPlacesList() {
        List<Place> result = new ArrayList<>();
        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;
            result = placeService.getPlacesList(user, Integer.MAX_VALUE)
        } else {
            result = placeService.getPlacesList(20)
        }

        render(template: '/place/layouts/placesList', model: [places: result])
    }
}
