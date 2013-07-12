<%@ page import="ru.nektodev.needtovisit.Place; ru.nektodev.needtovisit.UserPlaceRelation; ru.nektodev.needtovisit.Users" %>
<span id="datepicker" data-date-format="dd.mm.yyyy"
      data-date="${formatDate([format: "dd.MM.yyyy", date: new Date()])}">

</span>
<script type="text/javascript">

    function openForm(id) {

        $("#place-list-item-collapse_" + id).on('show', function() {
            $("#place-list-table-wrapper_" + id).slideUp();
            $("#place-list-item-header_" + id).slideDown();

        });

        $("#place-list-item-collapse_" + id).on('hide', function() {

            $("#place-list-item-header_" + id).slideUp();
            $("#place-list-table-wrapper_" + id).slideDown();
        });

        $("#place-list-item-collapse_" + id).collapse('show');

    }

    function toggleForm(id) {
        if ($('#place-list-item-collapse_' + id).hasClass('in')) {
            $("#place-list-item-collapse_" + id).collapse('hide');

        } else {
            jQuery.ajax({
                type: 'POST',
                data: {'id': id},
                url: '/needtovisit/userPlaceRelation/loadCollapseForm',
                success: function (data, textStatus) {
                    jQuery('#place-list-item-collapse-inner_' + id).html(data);
                    openForm(id);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    failOpenCollapse(XMLHttpRequest);
                }
            });
        }
    }
</script>

<style>
    .place-list-item-header{

        padding: 8px;
        border: none;
        border-radius: 4px 4px 0 0;
        color: white;

        background-image: linear-gradient(bottom, rgb(0,133,204) 0%, rgba(0,133,204, 0.66) 65%);
        background-image: -o-linear-gradient(bottom, rgb(0,133,204) 0%, rgba(0,133,204, 0.66) 65%);
        background-image: -moz-linear-gradient(bottom, rgb(0,133,204) 0%, rgba(0,133,204, 0.66) 65%);
        background-image: -webkit-linear-gradient(bottom, rgb(0,133,204) 0%, rgba(0,133,204, 0.66) 65%);
        background-image: -ms-linear-gradient(bottom, rgb(0,133,204) 0%, rgba(0,133,204, 0.66) 65%);

        background-image: -webkit-gradient(
            linear,
            right bottom,
            right top,
            color-stop(0, rgba(0,133,204, 1)),
            color-stop(0.65, rgba(0,133,204, 0.66))
        );
    }
    .place-list-item-header .name{
        font-size: 120%;
        text-shadow: 0px -1px 0px rgb(78, 78, 78);
    }


</style>
<g:each in="${places}" status="i" var="placeInstance">
    <g:set var="instanceRelation"
           value="${UserPlaceRelation.findAllByPlace(placeInstance).find({ it.user.id.toString().equals(sec.loggedInUserInfo(field: 'id').toString()) })}"/>

    <div class="accordion-group">
        <div id="place-item-header_${placeInstance.id}"
             class="place-list-item accordion-heading"
             onclick="toggleForm(${placeInstance.id});">

            <div id="place-list-item-header_${placeInstance.id}"
                 class="place-list-item-header"
                 style="display: none;"
            >
                <span class="name">${placeInstance?.name}</span>
                    <g:if test="${instanceRelation?.dateVisited}">
                        <small><i>
                            Вы уже тут были ${formatDate([date: instanceRelation?.dateVisited, format: 'dd.MM.yyyy'])}
                        </i></small>
                    </g:if>

            </div>

            <div id="place-list-table-wrapper_${placeInstance.id}"><table id="place-list-table_${placeInstance.id}" class="places-table table">

                <tbody>

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
            </table></div>
        </div>

        <sec:ifLoggedIn>
            <div id="place-list-item-collapse_${placeInstance.id}" class="collapse accordion-body">
                <div id="place-list-item-collapse-inner_${placeInstance.id}" class="accordion-inner">

                </div>
            </div>
        </sec:ifLoggedIn>
    </div>
</g:each>


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