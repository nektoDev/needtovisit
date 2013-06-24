package needtovisit
import org.springframework.transaction.annotation.Transactional
import ru.nektodev.needtovisit.Place
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
            if (place.save(flush: true)) {
                def rel = userPlaceRelationService.save(place, u)
                if (rel != null) {
                    place.addToUserRelation(rel);
                    place.save()
                    return place;
                }
            }
        }
        return null
    }
}
