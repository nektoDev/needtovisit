<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation; ru.nektodev.needtovisit.Users" %>
<span id="datepicker" data-date-format="dd.mm.yyyy"
      data-date="${formatDate([format: "dd.MM.yyyy", date: new Date()])}">

</span>
<table id="place-list-table" class="places-table table">

    <tbody>
    <g:each in="${places}" status="i" var="placeInstance">
        <g:set var="instanceRelation"
               value="${UserPlaceRelation.findAllByPlace(placeInstance).find({ it.user.id.toString().equals(sec.loggedInUserInfo(field: 'id').toString()) })}"/>
        <sec:ifLoggedIn>
            <tr class="${instanceRelation?.visited ? 'visited' : ''}">
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <tr>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
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
                               )}"
                            ></i>
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
        <td class="image" style="width: 24px;">
            <img src='${createLink([uri: "/images/place-default.jpg"])}' class='img-rounded place-img-small'/>
        </td>

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
            <td colspan="2">
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
    </g:each>
    </tbody>
</table>

<div id="visited-popup-wrapper">
    <g:render id="visited-popup-render" template="/userPlaceRelation/layouts/visitedPopup"/>
</div>

<script type="text/javascript">
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    jQuery(function () {
        autocompleteAddPlace();

        $('#datepicker').datepicker({
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            },
            weekStart: 1

        }).on('changeDate',
                function (ev) {

                    $('#add-date-icon').showHtml($(this).data('date'));

                });
    });
</script>