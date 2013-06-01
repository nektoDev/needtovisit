<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>NeedToVisit</title>
</head>
<body>
<div class="page-header"><h1>Заголовок страницы</h1></div>
<table class="table table-striped">
    <thead>
    <tr>

        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}" />
        <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}" />
    </tr>
    </thead>
    <tbody>
    <g:each in="${placeInstanceList}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${placeInstance.id}">${fieldValue(bean: placeInstance, field: "name")}</g:link></td>
            <td><g:link action="show" id="${placeInstance.userRelation.user.id}">${fieldValue(bean: placeInstance, field: "userRelation.user.username")}</g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>
