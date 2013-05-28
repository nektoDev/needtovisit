package ru.nektodev.needtovisit

import org.apache.commons.lang.builder.HashCodeBuilder

class UsersRole implements Serializable {

	Users user
	Role role

	boolean equals(other) {
		if (!(other instanceof UsersRole)) {
			return false
		}

		other.user?.id == user?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static UsersRole get(long userId, long roleId) {
		find 'from UsersRole where user.id=:userId and role.id=:roleId',
			[userId: userId, roleId: roleId]
	}

	static UsersRole create(Users user, Role role, boolean flush = false) {
		new UsersRole(user: user, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(Users user, Role role, boolean flush = false) {
		UsersRole instance = UsersRole.findByUserAndRole(user, role)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Users user) {
		executeUpdate 'DELETE FROM UsersRole WHERE user=:user', [user: user]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM UsersRole WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'user']
		version false
	}
}
