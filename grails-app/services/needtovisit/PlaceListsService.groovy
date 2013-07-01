package needtovisit

import ru.nektodev.needtovisit.Place
import ru.nektodev.needtovisit.Users

class PlaceListsService {

    List<Place> getPlacesNewList(Users u, Long max = 10) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = Place.listByUserNotEqual(u) as List<Place>;
        }

        return result;
    }

    List<Place> getPlacesToVisitList(Users u, Long max = 10) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = Place.listNotVisitedByUser(u, max) as List<Place>;
        }

        return result;
    }

    List<Place> getPlacesVisitedList(Users u, Long max = 10) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = Place.listVisitedByUser(u, max) as List<Place>;
        }

        return result;
    }
    
    List<Place> getPlacesList(Long max = 10) {
        return Place.list([order: "id desc"])
    }
    
    List<Place> getPlacesList(Users u, Long max = 20) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = Place.listByUser(u, max) as List<Place>;
        }

        return result;
    }
}
