<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>NeedToVisit</title>
</head>
<body>
<div class="page-header"><h1>Заголовок страницы</h1></div>
<h3>Хотите посетить?
    <sec:ifNotLoggedIn>
        <small class="muted"><g:link controller="users" action="add">Зарегистрируйтесь</g:link> или <g:link controller="login" action="auth">войдите</g:link>, чтобы не забыть сходить или найти компанию</small>
    </sec:ifNotLoggedIn>
    </h3>
<table class="table table-striped">
    <thead>
    <tr>
        <th></th>
        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}" />
        <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}" />
    </tr>
    </thead>
    <tbody>
    <g:each in="${newPlaces}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:checkBox name="wannaVisit" disabled="sec.ifNotLoggedIn" value="${placeInstance.wannaVisit.booleanValue()}"/></td>
            <td><g:link controller="place" action="show" id="${placeInstance.place.id}">${fieldValue(bean: placeInstance, field: "place.name")}</g:link></td>
            <td><g:link controller="users" action="show" id="${placeInstance.user.id}">${fieldValue(bean: placeInstance, field: "user.username")}</g:link></td>

        </tr>
    </g:each>
    </tbody>
</table>
<sec:ifLoggedIn>
    <h3>Уже посетили?</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th></th>
            <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}" />
            <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${placesToVisit}" status="i" var="placeToVisit">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:checkBox name="visited" value="${placeToVisit.visited}"/></td>
                <td><g:link controller="place" action="show" id="${placeToVisit.place.id}">${fieldValue(bean: placeToVisit, field: "place.name")}</g:link></td>
                <td><g:link controller="users" action="show" id="${placeToVisit.user.id}">${fieldValue(bean: placeToVisit, field: "user.username")}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <h3>Еще разок?</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th></th>
            <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}" />
            <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${placesVisited}" status="i" var="placeToVisit">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:checkBox name="visited" value="${placeToVisit.visited}"/></td>
                <td><g:link controller="place" action="show" id="${placeToVisit.place.id}">${fieldValue(bean: placeToVisit, field: "place.name")}</g:link></td>
                <td><g:link controller="users" action="show" id="${placeToVisit.user.id}">${fieldValue(bean: placeToVisit, field: "user.username")}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>
</sec:ifLoggedIn>
</body>
</html>
