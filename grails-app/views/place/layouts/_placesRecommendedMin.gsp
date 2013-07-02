<table id="place-recommended-table" class="table table-condensed">
    <tbody>

    <g:each in="${places}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link controller="place" action="show"
                        id="${placeInstance.id}">
                ${fieldValue(bean: placeInstance, field: "name")}</g:link>
            </td>

            <td>
                <span class="pull-right control">
                    <img src="${createLink([uri: "/images/add.png"])}"
                         onclick=" ${remoteFunction(controller: 'index',
                                 action: 'addUserPlaceRelation',
                                 params: [place: placeInstance.id],
                                 onSuccess: 'successAddRelation();'
                         )}">
                </span>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

