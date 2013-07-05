package ru.nektodev.needtovisit

import grails.plugins.springsecurity.Secured
import ru.nektodev.needtovisit.exceptions.DatabaseSaveException

class IndexController {

    def springSecurityService

    def placeListsService

    def placeService

    def userPlaceRelationService;

    def index() {
        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;

            def refresh = {placeService.getPlacesList(user)};
            placeListsService.setPlaces(refresh)

        } else {
            Closure refresh = {placeService.getPlacesList(20)}
            placeListsService.setPlaces(refresh)

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
        render(template: '/place/layouts/placesList', model: [places: placeListsService.getPlaces()])
    }
}
