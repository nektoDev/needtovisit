<%--

  User: tsykin.vyacheslav

--%>

<table id="place-to-visit-table" class="table table-striped table-condensed">
    <thead>
    <tr>
        <th><input type="checkbox"/></th>
        <g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}"/>
        <g:sortableColumn property="username" title="${message(code: 'place.username.label', default: 'Username')}"/>

        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${places}" status="i" var="placeToVisit">

        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td> <input type="checkbox"/></td>
            <td><g:link controller="place" action="show"
                        id="${placeToVisit.id}">${fieldValue(bean: placeToVisit, field: "name")}</g:link></td>
            <td>
                <g:each in="${placeToVisit.userRelation.user}" var="user">
                    <g:link controller="users" action="show" class="label"
                            id="${user.id}">${fieldValue(bean: user, field: "username")}</g:link>
                </g:each>
            </td>

            <td>
                <span class="pull-right control">
                    <img src="${createLink([uri: "/images/check.png"])}"
                         onclick="
                         ${remoteFunction(controller: 'userPlaceRelation',
                                 action: 'loadVisitedPopup',
                                 params: [placeId: placeToVisit.id],
                                 update: 'visited-popup-wrapper',
                                 onSuccess: "successLoadVisitedPopup()",
                                 onFailure: "failureLoadVisitedPopup()"
                         )}">
                </span>
                </td>

        </tr>
    </g:each>
    </tbody>
</table>
<div id="visited-popup-wrapper">
<g:render id="visited-popup-render" template="/userPlaceRelation/layouts/visitedPopup"/>
</div>
<g:javascript>
    function successLoadVisitedPopup() {

        jQuery('#visited-popup').on('shown', function () {
            jQuery('#comment').focus();
            jQuery('#visited-popup').bind('keydown', function (event) {
                if (event.keyCode == 13 && event.ctrlKey) {
                    jQuery('#visited-popup #setVisitedPopupSubminBtn').click();
                }
            })
        });
        jQuery('#visited-popup').modal('show');

    }

    function failureLoadVisitedPopup() {
        jQuery("#alert #alert-content").html("Произошла ошибка!");
        showAlert('alert-error');
    }
</g:javascript>
