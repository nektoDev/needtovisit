
<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userPlaceRelation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userPlaceRelation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userPlaceRelation">
			
				<g:if test="${userPlaceRelationInstance?.place}">
				<li class="fieldcontain">
					<span id="place-label" class="property-label"><g:message code="userPlaceRelation.place.label" default="Place" /></span>
					
						<span class="property-value" aria-labelledby="place-label"><g:link controller="place" action="show" id="${userPlaceRelationInstance?.place?.id}">${userPlaceRelationInstance?.place?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userPlaceRelationInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="userPlaceRelation.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="users" action="show" id="${userPlaceRelationInstance?.user?.id}">${userPlaceRelationInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userPlaceRelationInstance?.visited}">
				<li class="fieldcontain">
					<span id="visited-label" class="property-label"><g:message code="userPlaceRelation.visited.label" default="Visited" /></span>
					
						<span class="property-value" aria-labelledby="visited-label"><g:formatBoolean boolean="${userPlaceRelationInstance?.visited}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userPlaceRelationInstance?.wannaVisit}">
				<li class="fieldcontain">
					<span id="wannaVisit-label" class="property-label"><g:message code="userPlaceRelation.wannaVisit.label" default="Wanna Visit" /></span>
					
						<span class="property-value" aria-labelledby="wannaVisit-label"><g:formatBoolean boolean="${userPlaceRelationInstance?.wannaVisit}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userPlaceRelationInstance?.id}" />
					<g:link class="edit" action="edit" id="${userPlaceRelationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
