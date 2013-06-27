package ru.nektodev.needtovisit

class Users {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    static hasMany = [placeRelation: UserPlaceRelation]

	static constraints = {
		username blank: false, unique: true
		password blank: false
        enabled         defaultValue: true
        accountExpired  defaultValue: false
        accountLocked   defaultValue: false
        passwordExpired defaultValue: false
    }

	static mapping = {
		password column: '`password`'
        placeRelation lazy: false
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
