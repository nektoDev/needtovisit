package ru.nektodev.needtovisit

class IndexController {

    def springSecurityService

    def index() {
        List<UserPlaceRelation> placeToVisit = new ArrayList<>();
        List<UserPlaceRelation> placeVisited = new ArrayList<>();
        List<UserPlaceRelation> newPlaces = new ArrayList<>();
        if (springSecurityService.isLoggedIn()) {
            def user = springSecurityService.currentUser
            def temp = UserPlaceRelation.findAllByUser(user as Users);
            for (UserPlaceRelation rel : temp) {
                if (rel.visited) {
                    placeVisited.add(rel);
                } else {
                    placeToVisit.add(rel);
                }
            }
            newPlaces = UserPlaceRelation.findAllByUserNotEqual(user as Users)
        } else {
            newPlaces = UserPlaceRelation.list()
        }
        [newPlaces: newPlaces, placeToVisit: placeToVisit, placeVisited: placeVisited]
    }
}
