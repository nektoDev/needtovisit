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

    static belongsTo = [place: Place, user: Users]

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
}
