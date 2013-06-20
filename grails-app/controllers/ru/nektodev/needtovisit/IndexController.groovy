package ru.nektodev.needtovisit

class IndexController {
    static scope = "session"

    def springSecurityService

    List<Place> placesToVisit = new ArrayList<>();
    List<UserPlaceRelation> placeVisited = new ArrayList<>();
    List<Place> newPlaces = new ArrayList<>();

    def index() {
        updatePlaceLists()

        return [newPlaces: newPlaces, placesToVisit: placesToVisit, placesVisited: placeVisited]
    }

    def addUserPlaceRelation() {
        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;
            def p_id = params.get("place") as String;

            if (p_id != null && !p_id.isEmpty()) {

                Place p = Place.get(p_id as Long);
                if (p != null) {
                    UserPlaceRelation.findByUserAndPlace(user as Users, p) ?: new UserPlaceRelation(user: user, place: p).save(flush: true, insert: true);
                }

            }
            updatePlaceLists();
        }
        render 'OK'
    }

    def getNewPlaces() {
        render(template: 'newPlaces', model: ['places': newPlaces])
    }

    def getPlacesToVisit() {
        placeVisited = new ArrayList<>();

        if (springSecurityService.isLoggedIn()) {
            placesToVisit = Place.listByUserEqual(springSecurityService.currentUser as Users) as List<Place>;
        }
        render(template: 'placesToVisit', model: [places: placesToVisit])
    }

    def getPlacesVisited() {

        render(template: 'placesVisited', model: ['placesRel': placesVisited])
    }

    def List<Place> updatePlaceLists() {
        placesToVisit = new ArrayList<>();
        placeVisited = new ArrayList<>();
        newPlaces = new ArrayList<>();

        if (springSecurityService.isLoggedIn()) {
            Users user = springSecurityService.currentUser as Users;

            List<UserPlaceRelation> temp = UserPlaceRelation.findAllByUser(user as Users, [lazy: false]).withEagerDefault {} as List<UserPlaceRelation>;

            temp.each { UserPlaceRelation rel ->
                if (rel.visited) {
                    placeVisited.add(rel);
                }
            }

            placesToVisit = Place.listByUserEqual(user) as List<Place>;
            newPlaces = Place.listByUserNotEqual(user) as List<Place>;

        } else {
            newPlaces = Place.list();
        }
    }
}
