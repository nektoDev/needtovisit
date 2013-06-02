import ru.nektodev.needtovisit.Place
import ru.nektodev.needtovisit.Role
import ru.nektodev.needtovisit.UserPlaceRelation
import ru.nektodev.needtovisit.Users
import ru.nektodev.needtovisit.UsersRole

class BootStrap {
    def springSecurityService;
    def init = { servletContext ->
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        def adminUser = Users.findByUsername('admin') ?: new Users(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)
        def u1 = Users.findByUsername('user') ?: new Users(
                username: 'user',
                password: 'user',
                enabled: true).save(failOnError: true)
        def u2 = Users.findByUsername('user2') ?: new Users(
                username: 'user2',
                password: 'user2',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UsersRole.create adminUser, adminRole
        }



        def zoo = Place.findByName("ZOO") ?: new Place(name: 'ZOO').save();
        def adminRelation = UserPlaceRelation.findByUserAndPlace(adminUser, zoo) ?: new UserPlaceRelation(user: adminUser, place: zoo).save(failOnError: true, flush: true, insert: true)
        UserPlaceRelation.findByUserAndPlace(u1, zoo) ?: new UserPlaceRelation(user: u1, place: zoo).save(failOnError: true, flush: true, insert: true)
        UserPlaceRelation.findByUserAndPlace(u2, zoo) ?: new UserPlaceRelation(user: u2, place: zoo).save(failOnError: true, flush: true, insert: true)
        def p1 = Place.findByName("ZOO2") ?: new Place(name: 'ZOO2').save();
        UserPlaceRelation.findByUserAndPlace(u1, p1) ?: new UserPlaceRelation(user: u1, place: p1).save(failOnError: true, flush: true, insert: true)
        UserPlaceRelation.findByUserAndPlace(u2, p1) ?: new UserPlaceRelation(user: u2, place: p1).save(failOnError: true, flush: true, insert: true)
        def p2 = Place.findByName("ZOO3") ?: new Place(name: 'ZOO3').save();
        UserPlaceRelation.findByUserAndPlace(u1, p2) ?: new UserPlaceRelation(user: u1, place: p2).save(failOnError: true, flush: true, insert: true)
        UserPlaceRelation.findByUserAndPlace(u2, p2) ?: new UserPlaceRelation(user: u2, place: p2).save(failOnError: true, flush: true, insert: true)
        def p3 = Place.findByName("ZOO4") ?: new Place(name: 'ZOO4').save();
        UserPlaceRelation.findByUserAndPlace(u2, p3) ?: new UserPlaceRelation(user: u2, place: p3).save(failOnError: true, flush: true, insert: true)
        def p4 = Place.findByName("ZOO5") ?: new Place(name: 'ZOO5').save();
        UserPlaceRelation.findByUserAndPlace(u1, p4) ?: new UserPlaceRelation(user: u1, place: p4).save(failOnError: true, flush: true, insert: true)
    }
    def destroy = {
    }
}
