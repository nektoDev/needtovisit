package needtovisit

import ru.nektodev.needtovisit.Place
import ru.nektodev.needtovisit.Users

class PlaceListsService {

    List<Place> getPlacesRecommendedList(Users u, Integer max = 7) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = Place.listByUserNotEqual(u, max) as List<Place>;
        } else {
            result = getPlacesList(max);
        }

        return result;
    }

    List<Place> getPlacesList(Integer max = 10) {
        return Place.list([order: "id desc"])
    }
    
    List<Place> getPlacesList(Users u, Integer max = Integer.MAX_VALUE) {
        List<Place> result = new ArrayList<>();

        if (u != null) {
            result = Place.listByUser(u, max) as List<Place>;
        }

        return result;
    }
}
