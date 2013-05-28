import ru.nektodev.needtovisit.Role
import ru.nektodev.needtovisit.User

class BootStrap {

    def init = { servletContext ->
        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        def adminUser = SecUser.findByUsername('admin') ?: new User(
                username: 'admin',
                password: springSecurityService.encodePassword('admin'),
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }

    }
    def destroy = {
    }
}
