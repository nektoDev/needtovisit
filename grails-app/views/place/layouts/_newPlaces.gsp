<table id="place-new-table" class="table table-striped table-condensed">

    <thead>
    <tr>
        <th></th>

        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
        <g:sortableColumn property="username" title="${message(code: 'place.username.label', default: 'Username')}"/>
        <th></th>

    </tr>
    </thead>
    <tbody>

    <g:each in="${places}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td> <input type="checkbox"/></td>
            <td><g:link controller="place" action="show"
                        id="${placeInstance.id}">
                ${fieldValue(bean: placeInstance, field: "name")}</g:link>
            </td>

            <td>
                <g:each in="${placeInstance.userRelation.user}" var="u">
                    <g:link controller="users" class="label" action="show">${u.username}</g:link>
                </g:each>
            </td>

            <td>
                <span class="pull-right control" onclick=" ${remoteFunction(controller: 'index',
                        action: 'addUserPlaceRelation',
                        params: [place: placeInstance.id],
                        onSuccess: 'successAddRelation();'
                )}">
                <g:img  dir="images" file="add.png"/>
                </span>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>