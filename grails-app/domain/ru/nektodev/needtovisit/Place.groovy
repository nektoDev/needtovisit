package ru.nektodev.needtovisit

/**
 * @author tsykin.vyacheslav ts.slawa@gmail.com

 * Date: 29.05.13
 */
class Place {
    String name
    static hasMany = [userRelation : UserPlaceRelation]
    static belongsTo = Users

    static constraints = {
        name blank: false, unique: true
    }

    static List<Place> listByUser(Users u) {
        def c = Place.createCriteria();

        def result = c.list {
            userRelation {
                eq("user", u)
            }
        }
        return result
    }

    static List<Place> listByUserNotEqual(Users u) {

        def result = Place.createCriteria().list {
          userRelation {
              ne("user", u)
          }
        }.groupBy{it}.keySet().asList()
        return result
    }
}
