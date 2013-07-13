<%@ page import="ru.nektodev.needtovisit.Place; ru.nektodev.needtovisit.UserPlaceRelation; ru.nektodev.needtovisit.Users" %>
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

            <g:render template="/place/layouts/placeItem" model="[placeInstance: placeInstance, instanceRelation: instanceRelation]"/>
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

    function openForm(id) {

        $("#place-list-item-collapse_" + id).on('show', function() {
            $("#place-list-table-wrapper_" + id).slideUp();
            $("#place-list-item-header_" + id).slideDown();

        });

        $("#place-list-item-collapse_" + id).on('hide', function() {

            $("#place-list-item-header_" + id).slideUp();
            $("#place-list-table-wrapper_" + id).slideDown();
        });

        $("#place-list-item-collapse_" + id).collapse('toggle');

    }

    function toggleForm(id) {
        if ($('#place-list-item-collapse_' + id).hasClass('in')) {
            $("#place-list-item-collapse_" + id).collapse('toggle');

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