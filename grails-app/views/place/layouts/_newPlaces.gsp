<table id="place-new-table" class="table table-striped">

    <thead>
    <tr>
        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
        <g:sortableColumn property="username" title="${message(code: 'place.username.label', default: 'Username')}"/>
        <th></th>

    </tr>
    </thead>
    <tbody>

    <g:each in="${places}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

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

                <input type="submit" class="btn btn-mini pull-right" onclick="
                    ${remoteFunction(controller: 'index',
                            action: 'addUserPlaceRelation',
                            params: [place: placeInstance.id],
                            onSuccess: 'successAddRelation();'
                    )}"
                    value="${message(code: "place.want", default: "Want")}"
                />

            </td>
        </tr>
    </g:each>
    </tbody>
</table>