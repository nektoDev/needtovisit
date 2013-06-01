import ru.nektodev.needtovisit.Place
import ru.nektodev.needtovisit.Role
import ru.nektodev.needtovisit.UsersRole
import ru.nektodev.needtovisit.Users
import ru.nektodev.needtovisit.Users

class BootStrap {
    def springSecurityService;
    def init = { servletContext ->
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        def adminUser = Users.findByUsername('admin') ?: new Users(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UsersRole.create adminUser, adminRole
        }

        def zoo = Place.findByName("ZOO") ?: new Place(name: 'ZOO').save();

    }
    def destroy = {
    }
}
