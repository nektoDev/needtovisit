package needtovisit

import org.springframework.transaction.annotation.Transactional
import ru.nektodev.needtovisit.Place
import ru.nektodev.needtovisit.UserPlaceRelation
import ru.nektodev.needtovisit.Users

class PlaceService {
    static scope = 'session'

    def springSecurityService;

    def userPlaceRelationService;

    @Transactional()
    def save(String name, Users u = springSecurityService.currentUser as Users) {
        if (name != null && !name.isEmpty()) {
            Place placeInstance = new Place(name: name);

            return save(placeInstance, u)
        }
        return null
    }

    @Transactional()
    def save(Place place, Users u = springSecurityService.currentUser as Users) {
        if (place != null) {

            place = Place.findByName(place.name) ?: place.save(flush: true);
            def rel = UserPlaceRelation.findByUserAndPlace(u, place) ?: userPlaceRelationService.save(place, u);
            if (rel != null) {
                return place;
            }
        }
        return null
    }

    def search(String query, Long max = 10) {
        List<Place> places = new ArrayList<>();
        if (query == null || query.isEmpty()) {
            places = Place.list(max: max);
        } else {
            places = Place.findAllByNameIlike('%' + query + '%', [max: max])
        }
        def result = [];
        places.each { Place p ->
            result.add([p, UserPlaceRelation.findAllByPlace(p)]);
        }
        return result;
    }

    List<Place> getPlacesRecommendedList(Users u, Integer max = 7) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = UserPlaceRelation.listByUserNotEqual(u, max) as List<Place>;
        } else {
            result = getPlacesList(max);
        }

        return result;
    }

    List<Place> getPlacesNotUserList(Users u, Integer max = Integer.MAX_VALUE) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = UserPlaceRelation.listByUserNotEqual(u, max) as List<Place>;
        } else {
            result = getPlacesList(max);
        }

        return result;
    }

    List<Place> getPlacesList(Integer max = 10) {
        return Place.list([max: max, order: "id desc"])
    }

    List<Place> getPlacesList(Users u, Integer max = Integer.MAX_VALUE) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = UserPlaceRelation.listByUser(u, max) as List<Place>;
        }

        return result;
    }

    List<Place> getPlacesNotVisitedList(Users u, Integer max = Integer.MAX_VALUE) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = UserPlaceRelation.listNotVisitedByUser(u, max);
        }

        return result;
    }

    List<Place> getPlacesVisitedList(Users u, Integer max = Integer.MAX_VALUE) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = UserPlaceRelation.listVisitedByUser(u, max) as List<Place>;
        }

        return result;
    }
}
