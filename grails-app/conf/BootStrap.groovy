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
        Users.findByUsername('user') ?: new Users(
                username: 'user',
                password: 'user',
                enabled: true).save(failOnError: true)
        Users.findByUsername('user2') ?: new Users(
                username: 'user2',
                password: 'user2',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UsersRole.create adminUser, adminRole
        }



        def zoo = Place.findByName("ZOO") ?: new Place(name: 'ZOO').save();
        def adminRelation = UserPlaceRelation.findByUserAndPlace(adminUser, zoo) ?: new UserPlaceRelation(user: adminUser, place: zoo).save(failOnError: true)
        Place.findByName("ZOO2") ?: new Place(name: 'ZOO2').save();
        Place.findByName("ZOO3") ?: new Place(name: 'ZOO3').save();
        Place.findByName("ZOO4") ?: new Place(name: 'ZOO4').save();
        Place.findByName("ZOO5") ?: new Place(name: 'ZOO5').save();
    }
    def destroy = {
    }
}
