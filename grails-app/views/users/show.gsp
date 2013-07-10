<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation; needtovisit.PlaceService; ru.nektodev.needtovisit.Users" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'users.label', default: 'Users')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <parameter name="header-page" value="${usersInstance?.username}"/>
</head>

<body>
<a href="#show-users" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div id="show-users" class="content scaffold-show" role="main">

    <ol class="property-list users">

        <g:if test="${usersInstance?.username}">
            <li class="fieldcontain">
                <span id="username-label" class="property-label"><g:message code="users.username.label"
                                                                            default="Username"/></span>

                <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usersInstance}"
                                                                                            field="username"/></span>

            </li>
        </g:if>
    </ol>
</div>

<div id="places-list-render-wrapper">
    <g:render id="placesListRender" template="/place/layouts/placesList" model="[places: places]"/>
</div>

</body>
</html>
