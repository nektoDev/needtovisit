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

    def addUserPlaceRelation() {
        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;
            def p_id = params.get("place") as String;

            if (p_id != null && !p_id.isEmpty()) {

                Place p = Place.get(p_id as Long);
                if (p != null){
                    UserPlaceRelation.findByUserAndPlace(user as Users, p) ?: new UserPlaceRelation(user: user, place: p).save(flush: true, insert: true);
                }

            }
        index();
        }
    }
}
