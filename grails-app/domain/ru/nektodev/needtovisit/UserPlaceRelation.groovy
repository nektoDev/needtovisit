package ru.nektodev.needtovisit

import grails.validation.Validateable

/**
 * @author tsykin.vyacheslav ts.slawa@gmail.com

 * Date: 02.06.13
 */

@Validateable
class UserPlaceRelation implements Serializable {
    Users user
    Place place
    boolean visited
    Date dateToVisit
    Date dateVisited
    Date dateCreated
    Date lastUpdated

    String comment

    static constraints = {
        visited visited: false, blank: false

        dateToVisit nullable: true
        dateVisited nullable: true
        comment nullable: true
    }

    static mapping = {
        id composite: ['user', 'place']
        version false
        autoTimestamp true

        place lazy: false
        user lazy: false
        comment sqlType: "text"
    }

    static List<Place> listByUser(Users u, Integer max = 20) {
        if (max == null) {
            max = Integer.MAX_VALUE;
        }
        def result = listNotVisitedByUser(u, max);
        result.addAll(listVisitedByUser(u, max));

        return result
    }

    static List<Place> listByUserNotEqual(Users u, Integer max = Integer.MAX_VALUE) {

        if (max == null) {
            max = Integer.MAX_VALUE;
        }

        def result = executeQuery(
                """FROM Place pl
                        WHERE NOT EXISTS
                             (FROM UserPlaceRelation ur
                                 WHERE ur.place = pl AND ur.user = :user)

                """, [user: u], [max: max])

        return result
    }

    static List<Place> listNotVisitedByUser(Users u, Integer max = 10) {
        if (max == null) {
            max = Integer.MAX_VALUE;
        }
        def result = executeQuery(
                """FROM Place pl
                        WHERE EXISTS
                             (FROM UserPlaceRelation ur
                                 WHERE ur.place = pl AND ur.user = :user AND ur.visited = false)""", [user: u], [max: max])

        return result
    }

    static List<Place> listVisitedByUser(Users u, Integer max = 10) {
        if (max == null) {
            max = Integer.MAX_VALUE;
        }
        def result = executeQuery(
                """FROM Place pl
                        WHERE EXISTS
                             (FROM UserPlaceRelation ur
                                 WHERE ur.place = pl AND ur.user = :user AND ur.visited = true)""", [user: u], [max: max])

        return result
    }
}
