package ru.nektodev.needtovisit

/**
 * @author tsykin.vyacheslav ts.slawa@gmail.com

 * Date: 29.05.13
 */
class Place {
    String name
    static hasMany = [user : UserPlaceRelation]
    static belongsTo = Users

    static constraints = {
        name blank: false, unique: true
    }

}
