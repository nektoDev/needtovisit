package ru.nektodev.needtovisit
/**
 * @author tsykin.vyacheslav ts.slawa@gmail.com

 * Date: 29.05.13
 */
class Place {
    String name
    static hasMany = [userRelation: UserPlaceRelation]

    static constraints = {
        name blank: false, unique: true
    }

    static mapping = {
        user lazy: false

    }

    static List<Place> listByUser(Users u, Integer max = 20) {

        def result = listNotVisitedByUser(u, max);
        result.addAll(listVisitedByUser(u, max));

        return result
    }

    static List<Place> listByUserNotEqual(Users u, Integer max = Integer.MAX_VALUE) {

        def result = executeQuery(
                    """SELECT DISTINCT p FROM Place p JOIN FETCH p.userRelation ur
                        WHERE NOT EXISTS
                             (FROM p.userRelation ur
                                 WHERE ur.user = :user)
                        ORDER BY ur.dateCreated DESC""", [user: u], [max: max])

        return result
    }

    static List<Place> listNotVisitedByUser(Users u, Integer max = 10) {

        def result = executeQuery(
                """SELECT DISTINCT p FROM Place p JOIN FETCH p.userRelation ur
                        WHERE EXISTS
                             (FROM p.userRelation ur
                                 WHERE ur.user = :user AND ur.visited = false)
                        ORDER BY ur.dateCreated DESC""", [user: u], [max: max])

        return result
    }

    static List<Place> listVisitedByUser(Users u, Integer max = 10) {

        def result = executeQuery(
                """SELECT DISTINCT p FROM Place p JOIN FETCH p.userRelation ur
                        WHERE EXISTS
                             (FROM p.userRelation ur
                                 WHERE ur.user = :user AND ur.visited = true)
                         ORDER BY ur.dateCreated DESC""", [user: u], [max: max])

        return result
    }
}
