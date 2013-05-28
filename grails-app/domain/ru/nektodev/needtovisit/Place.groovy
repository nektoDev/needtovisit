package ru.nektodev.needtovisit

/**
 * @author tsykin.vyacheslav ts.slawa@gmail.com

 * Date: 29.05.13
 */
class Place {
    String name
    boolean visited


    static constraints = {
        name blank: false, unique: true
    }

}
