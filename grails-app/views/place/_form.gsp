<%@ page import="ru.nektodev.needtovisit.Place" %>



<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="place.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${placeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="place.user.label" default="User" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${placeInstance?.user?}" var="u">
    <li><g:link controller="userPlaceRelation" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userPlaceRelation" action="create" params="['place.id': placeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation')])}</g:link>
</li>
</ul>

</div>

