<%--

  User: tsykin.vyacheslav

--%>

<table id="place-to-visit-table" class="table table-striped">
    <thead>
    <tr>
        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
        <g:sortableColumn property="username" title="${message(code: 'place.username.label', default: 'Username')}"/>

        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${places}" status="i" var="placeToVisit">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link controller="place" action="show"
                        id="${placeToVisit.id}">${fieldValue(bean: placeToVisit, field: "name")}</g:link></td>
            <td>
                <g:each in="${placeToVisit.userRelation.user}" var="user">
                    <g:link controller="users" action="show" class="label"
                        id="${user.id}">${fieldValue(bean: user, field: "username")}</g:link>
                </g:each>
            </td>

            <td><button class="btn btn-mini pull-right " disabled="disabled">${message(code: 'place.visited', default: 'Visit')}</button></td>

        </tr>
    </g:each>
    </tbody>
</table>