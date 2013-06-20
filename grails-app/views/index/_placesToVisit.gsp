<%--

  User: tsykin.vyacheslav

--%>

<table id="place-to-visit-table" class="table table-striped">
    <thead>
    <tr>
        <th></th>
        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
        <g:sortableColumn property="username" title="${message(code: 'place.name.label', default: 'Username')}"/>
    </tr>
    </thead>
    <tbody>
    <g:each in="${placesRel}" status="i" var="placeToVisit">
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