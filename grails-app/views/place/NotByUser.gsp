<%@ page import="ru.nektodev.needtovisit.Place" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'place.label', default: 'Place')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="page-header"><h1>Что еще можно посетить</h1></div>

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
