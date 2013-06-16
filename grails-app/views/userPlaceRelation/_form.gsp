<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation" %>



<div class="fieldcontain ${hasErrors(bean: userPlaceRelationInstance, field: 'place', 'error')} required">
	<label for="place">
		<g:message code="userPlaceRelation.place.label" default="Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="place" name="place.id" from="${ru.nektodev.needtovisit.Place.list()}" optionKey="id" required="" value="${userPlaceRelationInstance?.place?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userPlaceRelationInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userPlaceRelation.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${ru.nektodev.needtovisit.Users.list()}" optionKey="id" required="" value="${userPlaceRelationInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userPlaceRelationInstance, field: 'visited', 'error')} ">
	<label for="visited">
		<g:message code="userPlaceRelation.visited.label" default="Visited" />
		
	</label>
	<g:checkBox name="visited" value="${userPlaceRelationInstance?.visited}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userPlaceRelationInstance, field: 'wannaVisit', 'error')} ">
	<label for="wannaVisit">
		<g:message code="userPlaceRelation.wannaVisit.label" default="Wanna Visit" />
		
	</label>
	<g:checkBox name="wannaVisit" value="${userPlaceRelationInstance?.wannaVisit}" />
</div>

