package ru.nektodev.needtovisit

class Users {

    transient springSecurityService

    String username
    String password
    String email
    String firstName
    String lastName

    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email email: true, nullable: true, unique: true
        firstName nullable: true
        lastName nullable: true

        enabled defaultValue: true
        accountExpired defaultValue: false
        accountLocked defaultValue: false
        passwordExpired defaultValue: false
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UsersRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
