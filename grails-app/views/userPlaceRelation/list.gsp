<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'userPlaceRelation.label', default: 'UserPlaceRelation')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-userPlaceRelation" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                        default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-userPlaceRelation" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-striped">
        <thead>
        <tr>

            <th><g:message code="userPlaceRelation.place.label" default="Place"/></th>

            <th><g:message code="userPlaceRelation.user.label" default="User"/></th>

            <g:sortableColumn property="visited"
                              title="${message(code: 'userPlaceRelation.visited.label', default: 'Visited')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${userPlaceRelationInstanceList}" status="i" var="userPlaceRelationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" user="${userPlaceRelationInstance.user}"
                            place="${userPlaceRelationInstance.place}">${fieldValue(bean: userPlaceRelationInstance, field: "place")}</g:link></td>

                <td>${fieldValue(bean: userPlaceRelationInstance, field: "user")}</td>

                <td><g:formatBoolean boolean="${userPlaceRelationInstance.visited}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${userPlaceRelationInstanceTotal}"/>
    </div>
</div>
</body>
</html>
