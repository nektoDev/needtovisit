<%--

  User: tsykin.vyacheslav

--%>

<table id="place-to-visit-table" class="table table-striped table-condensed">
    <thead>
    <tr>
        <th><input type="checkbox"/></th>
        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
        <g:sortableColumn property="username" title="${message(code: 'place.username.label', default: 'Username')}"/>

        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${places}" status="i" var="placeToVisit">

        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td> <input type="checkbox"/></td>
            <td><g:link controller="place" action="show"
                        id="${placeToVisit.id}">${fieldValue(bean: placeToVisit, field: "name")}</g:link></td>
            <td>
                <g:each in="${placeToVisit.userRelation.user}" var="user">
                    <g:link controller="users" action="show" class="label"
                            id="${user.id}">${fieldValue(bean: user, field: "username")}</g:link>
                </g:each>
            </td>

            <td>
                <span class="pull-right control" onclick=" ">
                    <g:img  dir="images" file="check.png"/>
                </span>
                </td>

        </tr>
    </g:each>
    </tbody>
</table>