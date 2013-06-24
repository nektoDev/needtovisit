package needtovisit

import org.springframework.transaction.annotation.Transactional
import ru.nektodev.needtovisit.Place
import ru.nektodev.needtovisit.UserPlaceRelation
import ru.nektodev.needtovisit.Users

class PlaceService {
    static scope = 'session'

    @Transactional()
    def addPlaceRelation(Long placeId, Users u) {
        if (placeId == null || u == null) {
            return false
        }
        Place p = Place.get(placeId);
        if (p != null) {
            UserPlaceRelation.findByUserAndPlace(u, p) ?: new UserPlaceRelation(user: u, place: p).save();
            return true
        }
        return false
    }

    @Transactional()
    def save(String name) {
        if (name != null && !name.isEmpty()) {
            Place placeInstance = new Place(name: name);

            if (placeInstance.save(flush: true)) {
                return placeInstance
            }
        }
        return null
    }

    def serviceMethod() {

    }
}
