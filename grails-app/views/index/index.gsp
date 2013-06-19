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
        <small class="muted"><g:link controller="users" action="add">Зарегистрируйтесь</g:link> или <g:link
                controller="login" action="auth">войдите</g:link>, чтобы не забыть сходить или найти компанию</small>
    </sec:ifNotLoggedIn>

</h3>

<table id="place-new-table" class="table table-striped">

    <thead>
    <tr>
        <th></th>
        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
        <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}"/>
    </tr>
    </thead>
    <tbody>

    <g:each in="${newPlaces}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>
                <g:formRemote name="xx"
                              update="place-new-table"
                              url="[controller: 'index', action: 'updateDiv', params: [place: placeInstance, user: sec.loggedInUserInfo(field: 'id')]]">
                    <input type="submit"/>
                    <div class="btn btn-mini" onclick="form.submit()">ДА</div>
                </g:formRemote>

            </td>
            <td><g:link controller="place" action="show"
                        id="${placeInstance.id}">${fieldValue(bean: placeInstance, field: "name")}</g:link>
            </td>

            <td>
                <g:each in="${placeInstance.userRelation.user}" var="u">
                    <g:link controller="users" class="label" action="show">${u.username}</g:link>
                </g:each>
            </td>

        </tr>
    </g:each>
    </tbody>
</table>

<div id="test">
    ${newPlaces.name}
    <g:render id="" template="aa1" collection="${newPlaces}" var="placeI"/>
</div>

<sec:ifLoggedIn>

    <h3>Уже посетили?</h3>
    <table id="place-to-visit-table" class="table table-striped">
        <thead>
        <tr>
            <th></th>
            <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
            <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${placesToVisit}" status="i" var="placeToVisit">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><div class="btn btn-mini">ДА</div></td>

                <td><g:link controller="place" action="show"
                            id="${placeToVisit.place.id}">${fieldValue(bean: placeToVisit, field: "place.name")}</g:link></td>
                <td>
                    <g:link controller="users" action="show" class="label"
                            id="${placeToVisit.user.id}">${fieldValue(bean: placeToVisit, field: "user.username")}</g:link>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <h3>Еще разок?</h3>
    <table id="place-visited-table" class="table table-striped">
        <thead>
        <tr>
            <th></th>
            <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
            <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${placesVisited}" status="i" var="placeToVisit">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><div class="btn btn-mini">ДА</div></td>

                <td><g:link controller="place" action="show"
                            id="${placeToVisit.place.id}">${fieldValue(bean: placeToVisit, field: "place.name")}</g:link></td>
                <td>
                    <g:link controller="users" action="show"
                            id="${placeToVisit.user.id}">${fieldValue(bean: placeToVisit, field: "userRelation.user.username")}</g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</sec:ifLoggedIn>
</body>
</html>
