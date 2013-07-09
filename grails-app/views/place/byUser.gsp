<%@ page import="ru.nektodev.needtovisit.Place" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'place.label', default: 'Place')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <parameter name="header-page" value="Хотите посетить"/>

</head>

<body>
<div id="list-place" class="content scaffold-list" role="main">
    <div id="places-list-render-wrapper">
        <g:render id="placesListRender" template="/place/layouts/placesList" model="[places: placeInstanceList]"/>
    </div>

    <div class="pagination">
        <g:paginate total="${placeInstanceTotal}"/>
    </div>
</div>
</body>
</html>
