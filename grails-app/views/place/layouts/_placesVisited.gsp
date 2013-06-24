<table id="place-visited-table" class="table table-striped table-condensed">
    <thead>
    <tr>
        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
        <g:sortableColumn property="username" title="${message(code: 'place.username.label', default: 'Username')}"/>
        <th></th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${places}" status="i" var="placeVisited">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><div class="btn btn-mini">ДА</div></td>

            <td><g:link controller="place" action="show"
                        id="${placeVisited.id}">${fieldValue(bean: placeVisited, field: "name")}</g:link></td>
            <td>
                <g:each in="${placeVisited.userRelation.user}" var="user">
                    <g:link controller="users" action="show" class="label"
                            id="${user.id}">${fieldValue(bean: user, field: "username")}</g:link>
                </g:each>
            </td>
            <td><div class="btn btn-mini">ДА</div></td>
        </tr>
    </g:each>
    </tbody>
</table>