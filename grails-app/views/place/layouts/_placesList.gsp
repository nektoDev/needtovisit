<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation; ru.nektodev.needtovisit.Users" %>

<table id="place-list-table" class="table table-striped table-condensed places-table">
    <tbody>
    <g:each in="${places}" status="i" var="placeToVisit">
        <g:set var="isVisited"
               value="${placeToVisit.userRelation.find({ it.user.id.toString().equals(sec.loggedInUserInfo(field: 'id').toString()) })?.visited}"/>
        <sec:ifLoggedIn>
            <tr class="${isVisited ? 'visited' : ''}">
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <tr>
        </sec:ifNotLoggedIn>

        <td class="image">
            <img src='${createLink([uri: "/images/place-default.jpg"])}' class='img-rounded place-img-small'/>
        </td>

        <td>
            <g:link controller="place" action="show"
                    id="${placeToVisit.id}">${fieldValue(bean: placeToVisit, field: "name")}</g:link>
        </td>

        <td>
            <g:each in="${placeToVisit.userRelation.user}" var="user">
                <g:link controller="users" action="show" class="label"
                        id="${user.id}">${fieldValue(bean: user, field: "username")}</g:link>
            </g:each>
        </td>

        <sec:ifLoggedIn>
            <td>
                <span class="pull-right control">

                    <g:if test="${isVisited}">
                        <small class="muted">Вы уже посетили это место. <span class="btn btn-mini" onclick="
                        ${remoteFunction(controller: 'userPlaceRelation',
                                action: 'setVisitedAjax',
                                params: [placeId: placeToVisit.id, visited: false],
                                onSuccess: "successSetVisited(data)",
                                onFailure: "failtureSetVisited(XMLHttpRequest)"
                        )}">Еще раз?</span></small>
                    </g:if>
                    <g:else>
                        <img src="${createLink([uri: "/images/check.png"])}"
                             onclick="
                             ${remoteFunction(controller: 'userPlaceRelation',
                                     action: 'loadVisitedPopup',
                                     params: [placeId: placeToVisit.id],
                                     update: 'visited-popup-wrapper',
                                     onSuccess: "successLoadVisitedPopup()",
                                     onFailure: "failureLoadVisitedPopup()"
                             )}">
                    </g:else>
                </span>
            </td>
        </sec:ifLoggedIn>
        </tr>
    </g:each>
    </tbody>
</table>

<div id="visited-popup-wrapper">
    <g:render id="visited-popup-render" template="/userPlaceRelation/layouts/visitedPopup"/>
</div>
