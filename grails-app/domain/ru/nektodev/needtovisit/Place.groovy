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

    static List<Place> listByUser(Users u) {

        def result = createCriteria().list {
            userRelation {
                eq("user", u)
            }
        }
        return result
    }

    static List<Place> listByUserNotEqual(Users u) {

        def result = executeQuery(
                    """SELECT DISTINCT p FROM Place p JOIN FETCH p.userRelation ur
                        WHERE NOT EXISTS
                             (FROM p.userRelation ur
                                 WHERE ur.user = :user)""", [user: u])

        return result
    }

    static List<Place> listByUserEqual(Users u) {

        def result = executeQuery(
                """SELECT DISTINCT p FROM Place p JOIN FETCH p.userRelation ur
                        WHERE EXISTS
                             (FROM p.userRelation ur
                                 WHERE ur.user = :user)""", [user: u])

        return result
    }
}
