<%@ page import="ru.nektodev.needtovisit.Users" %>



<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="users.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${usersInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="users.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${usersInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="users.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${usersInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="users.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${usersInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="users.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${usersInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="users.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${usersInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'place', 'error')} ">
	<label for="place">
		<g:message code="users.place.label" default="Place" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usersInstance?.place?}" var="p">
    <li><g:link controller="userPlaceRelation" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userPlaceRelation" action="create" params="['users.id': usersInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation')])}</g:link>
</li>
</ul>

</div>

