<style>
.place-recommended {
    border: 1px solid #eeeeee;
    border-radius: 5px;
    height: 120px;
    width: 100%;
    margin-bottom: 10px;
    padding: 5px;
}

.recommended-title {
    text-transform: uppercase;
    font-weight: bold;
    color: #999999;
    width: 100%;
}
</style>


<div class="recommended-title">Рекомендуем</div>

%{--<table id="place-recommended-table" class="table places-table table-condensed place-recommended-table">
    <tbody>

    <g:each in="${places}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td class="image">
                <img src='${createLink([uri: "/images/place-default.jpg"])}' class='img-rounded place-img-small'/>
            </td>

            <td><g:link controller="place" action="show"
                        id="${placeInstance.id}">
                ${fieldValue(bean: placeInstance, field: "name")}</g:link>
            </td>

            <sec:ifLoggedIn>
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
            </sec:ifLoggedIn>
        </tr>
    </g:each>
    </tbody>
</table>--}%

