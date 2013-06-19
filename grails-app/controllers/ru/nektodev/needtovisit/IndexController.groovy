package ru.nektodev.needtovisit

class IndexController {

    def springSecurityService

    List<UserPlaceRelation> placeToVisit = new ArrayList<>();
    List<UserPlaceRelation> placeVisited = new ArrayList<>();
    List<Place> newPlaces = new ArrayList<>();

    def index() {

        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;

            List<UserPlaceRelation> temp = UserPlaceRelation.findAllByUser(user as Users) as List<UserPlaceRelation>;

            temp.each { UserPlaceRelation rel ->
                if (rel.visited) {
                    placeVisited.add(rel);
                } else {
                    placeToVisit.add(rel);
                }
            }

            newPlaces = Place.listByUserNotEqual(user) as List<Place>;

        } else {
            newPlaces = Place.list();
        }

        return [newPlaces: newPlaces, placesToVisit: placeToVisit, placesVisited: placeVisited]
    }

    def updateDiv = {
        index()
        render(view: 'index')
    }
}
