package needtovisit
import ru.nektodev.needtovisit.Place

class PlaceListsService implements Serializable{

    static scope = 'session'

    Closure refresh;

    List<Place> getPlaces() {
        return refresh();
    }

    void setPlaces(Closure c) {
        this.refresh = c;
    }
}
