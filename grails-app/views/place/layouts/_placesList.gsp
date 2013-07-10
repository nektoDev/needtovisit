<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation; ru.nektodev.needtovisit.Users" %>
<table id="place-list-table" class="places-table table">
    <tbody>
    <g:each in="${places}" status="i" var="placeToVisit">
        <g:set var="instanceRelation"
               value="${placeToVisit.userRelation.find({ it.user.id.toString().equals(sec.loggedInUserInfo(field: 'id').toString()) })}"/>
        <sec:ifLoggedIn>
            <tr class="${instanceRelation?.visited ? 'visited' : ''}">
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <tr>
        </sec:ifNotLoggedIn>

        <td class="image" style="width: 24px;">
            <img src='${createLink([uri: "/images/place-default.jpg"])}' class='img-rounded place-img-small'/>
        </td>

        <td>
            <g:link controller="place" action="show"
                    id="${placeToVisit.id}">${fieldValue(bean: placeToVisit, field: "name")}</g:link>
        </td>

        <td style="width: 10ex;">
            <g:formatDate date="${instanceRelation?.dateToVisit ?: instanceRelation?.dateVisited}" format="dd.MM.yyyy"/>
        </td>
        <g:if test="${instanceRelation?.visited}">
            <td colspan="2">
                <span class="pull-right control">
                    <small class="muted">Вы уже посетили это место.
                        <span class="btn btn-mini" onclick="
                        ${remoteFunction(controller: 'userPlaceRelation',
                                action: 'setVisitedAjax',
                                params: [placeId: placeToVisit.id, visited: false],
                                onSuccess: "successSetVisited(data)",
                                onFailure: "failtureSetVisited(XMLHttpRequest)"
                        )}">
                            Еще раз?
                        </span>
                    </small>
                </span>
            </td>
        </g:if>
        <g:else>
            <td style="width: 190px;">
                <g:each in="${placeToVisit.userRelation.user}" var="user" status="il">
                    <g:if test="${il < 5}"><g:link controller="users" action="show" class="label"
                            id="${user.id}">${fieldValue(bean: user, field: "id").toString().equalsIgnoreCase(sec.loggedInUserInfo(field: 'id').toString()) ? 'Вы' : fieldValue(bean: user, field: "username")}</g:link></g:if>
                </g:each>
            </td>

            <sec:ifLoggedIn>
                <td style="width: 24px;">
                    <span class="pull-right control">

                        <g:if test="${instanceRelation != null}">

                            <img src="${createLink([uri: "/images/check.png"])}"
                                 onclick="
                                 ${remoteFunction(controller: 'userPlaceRelation',
                                         action: 'loadVisitedPopup',
                                         params: [placeId: placeToVisit.id],
                                         update: 'visited-popup-wrapper',
                                         onSuccess: "successLoadVisitedPopup()",
                                         onFailure: "failureLoadVisitedPopup()"
                                 )}">

                        </g:if>
                        <g:else>
                            <span class="pull-right control">
                                <img src="${createLink([uri: "/images/add.png"])}"
                                     onclick=" ${remoteFunction(controller: 'index',
                                             action: 'addUserPlaceRelation',
                                             params: [place: placeToVisit.id],
                                             onSuccess: 'successAddRelation();'
                                     )}">
                            </span>
                        </g:else>

                    </span>
                </td>
            </sec:ifLoggedIn>
        </g:else>
        </tr>
    </g:each>
    </tbody>
</table>

<div id="visited-popup-wrapper">
    <g:render id="visited-popup-render" template="/userPlaceRelation/layouts/visitedPopup"/>
</div>
