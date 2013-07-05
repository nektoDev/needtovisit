package needtovisit
import ru.nektodev.needtovisit.Place

class PlaceListsService {

    static scope = 'session'

    List<Place> places;

    List<Place> getPlaces() {
        return places
    }

    void setPlaces(List<Place> places) {
        this.places = places
    }
}
