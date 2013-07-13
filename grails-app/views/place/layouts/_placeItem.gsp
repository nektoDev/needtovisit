<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation" %>
<div id="place-list-table-wrapper_${placeInstance.id}">
    <table id="place-list-table_${placeInstance.id}" class="places-table table">
        <tbody>

        <tr class="${sec.ifLoggedIn() && instanceRelation?.visited ? 'visited' : ''}">

            <sec:ifLoggedIn> %{--Main control element zone? show if logged in--}%
                <td style="width: 16px;">
                    <span class="pull-left">

                        <g:if test="${instanceRelation != null}">
                            <g:if test="${instanceRelation?.visited}">
                                <i class="icon-check icon-large"

                                   onclick="${remoteFunction(controller: 'userPlaceRelation',
                                           action: 'setVisitedAjax',
                                           params: [placeId: placeInstance.id, visited: false],
                                           onSuccess: "successSetVisited(data)",
                                           onFailure: "failtureSetVisited(XMLHttpRequest)"
                                   )}"></i>
                            </g:if>
                            <g:else>
                                <i class="icon-check-empty icon-large"
                                   onclick="${remoteFunction(controller: 'userPlaceRelation',
                                           action: 'loadVisitedPopup',
                                           params: [placeId: placeInstance.id],
                                           update: 'visited-popup-wrapper',
                                           onSuccess: "successLoadVisitedPopup()",
                                           onFailure: "failureLoadVisitedPopup()"
                                   )}"></i>

                            </g:else>
                        </g:if>

                        <g:else>

                            <i class="icon-plus icon-large"
                               onclick=" ${remoteFunction(controller: 'index',
                                       action: 'addUserPlaceRelation',
                                       params: [place: placeInstance.id],
                                       onSuccess: 'successAddRelation();'
                               )}"></i>

                        </g:else>

                    </span>
                </td>
            </sec:ifLoggedIn>

            <td>
                <g:link controller="place" action="show"
                        id="${placeInstance.id}">${fieldValue(bean: placeInstance, field: "name")}</g:link>

            </td>

            <td style="width: 10ex;">
                <g:formatDate
                        date="${instanceRelation?.visited ? instanceRelation?.dateVisited : instanceRelation?.dateToVisit}"
                        format="dd.MM.yyyy"/>
            </td>

            <g:if test="${instanceRelation?.visited}">
                <td style="width: 256px;">
                    <span class="pull-right control">
                        <small class="muted">Вы уже посетили это место.

                        </small>
                    </span>
                </td>
            </g:if>

            <g:else>
                <td style="width: 190px;">
                    <g:each in="${UserPlaceRelation.findAllByPlace(placeInstance)}" var="userR" status="il">
                        <g:if test="${il < 5}"><g:link controller="users" action="show" class="label"
                                                       id="${userR.user.id}">${fieldValue(bean: userR.user, field: "id").toString().equalsIgnoreCase(sec.loggedInUserInfo(field: 'id').toString()) ? 'Вы' : fieldValue(bean: userR.user, field: "username")}</g:link></g:if>
                    </g:each>
                </td>

                <sec:ifLoggedIn>
                    <td style="width: 50px;">
                        <span class="pull-right control">
                            <g:if test="${instanceRelation != null}">

                                <i class="icon-remove icon-large"
                                   onclick="${remoteFunction(controller: 'userPlaceRelation',
                                           action: 'delete',
                                           params: [id: placeInstance.id],
                                           onSuccess: 'successAddRelation();'
                                   )}"></i>

                            </g:if>
                        </span>
                    </td>
                </sec:ifLoggedIn>

            </g:else>
        </tr>

        </tbody>
    </table>
</div>