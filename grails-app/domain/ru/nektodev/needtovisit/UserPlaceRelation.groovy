package ru.nektodev.needtovisit

/**
 * @author tsykin.vyacheslav ts.slawa@gmail.com

 * Date: 02.06.13
 */
class UserPlaceRelation implements Serializable{
    Users user
    Place place
    boolean visited

    static constraints = {
        visited visited: false, blank : false
    }

    static mapping = {
        id composite: ['user', 'place']
        version false
        autoTimestamp false
        table : "User_Place"
    }
}
