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

        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}" />
        <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}" />
    </tr>
    </thead>
    <tbody>
    <g:each in="${newPlaces.place}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${placeInstance.id}">${fieldValue(bean: placeInstance, field: "name")}</g:link></td>
            <td><g:link action="show" id="${placeInstance.userRelation.user.id}">${fieldValue(bean: placeInstance, field: "userRelation.user.username")}</g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>
