package needtovisit

import grails.validation.Validateable
import org.springframework.transaction.annotation.Transactional
import ru.nektodev.needtovisit.Place
import ru.nektodev.needtovisit.UserPlaceRelation
import ru.nektodev.needtovisit.Users

@Validateable
class UserPlaceRelationService {

    def springSecurityService
    public static final UserPlaceRelation TEMPLATE_RELATION = new UserPlaceRelation()

    def getTemplateInstance() {
        TEMPLATE_RELATION.setPlace(new Place("TEMPLATE"))
        TEMPLATE_RELATION.setUser(springSecurityService.currentUser as Users)

        return TEMPLATE_RELATION
    }

    @Transactional
    def UserPlaceRelation save(Long placeId, Users u) {
        if (placeId == null || u == null) {
            return null
        }

        Place p = Place.get(placeId);

        return save(p, u)
    }

    @Transactional
    def UserPlaceRelation save(Place p, Users u) {
        if (p != null && u != null) {

            def relation = new UserPlaceRelation(user: u, place: p)
            UserPlaceRelation.findByUserAndPlace(u, p) ?: relation.save();

            return relation
        }

        return null
    }

    @Transactional
    def UserPlaceRelation setVisited(Place p, Users u, Date visitedDate) {
        UserPlaceRelation relation = UserPlaceRelation.findByUserAndPlace(u, p);

        if (relation != null) {
            relation.visited = true;
            relation.dateVisited = visitedDate;

            if (relation.save(flush: true)) {
                return relation;
            }
        }

        return null;
    }


}
