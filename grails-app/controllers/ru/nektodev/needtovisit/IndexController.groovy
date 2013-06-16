package ru.nektodev.needtovisit

class IndexController {

    def springSecurityService

    def index() {
        List<Place> placeToVisit = new ArrayList<>();
        List<Place> placeVisited = new ArrayList<>();
        List<Place> newPlaces = new ArrayList<>();
        if (springSecurityService.isLoggedIn()) {
            def user = springSecurityService.currentUser
            def temp = Place.listByUser(user as Users);
            for (Place p : temp) {
                if (p.userRelation.visited) {
                    placeVisited.add(p);
                } else {
                    placeToVisit.add(p);
                }
            }
            newPlaces = Place.listByUserNotEqual(user as Users)
        } else {
            newPlaces = Place.list()
        }

        [newPlaces: newPlaces, placesToVisit: placeToVisit, placesVisited: placeVisited]
    }
}
