<style type="text/css">
    #place-recommended-table td{
        vertical-align: middle;
    }

    #place-recommended-table {
        background-color: rgba(245, 245, 245, 0);
    }

    #place-recommended-table tr:hover{
        background-color: rgb(255, 255, 255);
    }

    #place-recommended-table tr:first-of-type td{
        border: none;
    }

    td.image {
        width: 24px;
    }
</style>

<table id="place-recommended-table" class="table table-condensed place-recommended-table">
    <tbody>

    <g:each in="${places}" status="i" var="placeInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td class="image">
                <img src='images/place-default.jpg' class='img-rounded place-img-small'/>
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
</table>

