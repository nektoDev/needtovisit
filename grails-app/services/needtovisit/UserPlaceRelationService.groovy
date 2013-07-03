package needtovisit

import org.springframework.transaction.annotation.Transactional
import ru.nektodev.needtovisit.Place
import ru.nektodev.needtovisit.UserPlaceRelation
import ru.nektodev.needtovisit.Users

class UserPlaceRelationService {

    def springSecurityService

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
    def UserPlaceRelation setVisited(Place p, Users u, Date visitedDate = new Date(), String comment, Boolean visited) {
        UserPlaceRelation relation = UserPlaceRelation.findByUserAndPlace(u, p);

        if (relation != null) {
            relation.visited = visited;

            if (visited) {
                relation.dateVisited = visitedDate;
                if (!comment?.isEmpty()) {
                    def commentString = "\n" + visitedDate.format('dd.MM.yyyy') + ":\n" + comment;
                    if (relation.comment == null || relation.comment.isEmpty())
                        relation.comment = commentString
                    else
                        relation.comment += commentString;
                }


            }

            if (relation.save(flush: true)) {
                return relation;
            }
        }

        return null;
    }


}
