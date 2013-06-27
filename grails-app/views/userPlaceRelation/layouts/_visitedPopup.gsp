<!-- Modal -->
<g:if test="${placeRel != null}">
<div id="visited-popup" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="tits" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h1 id="visited-popup-header-content"><g:img dir="images" file="place-default.jpg"/> ${placeRel.place.name}</h1>
    </div>
    <g:formRemote name="saveVisited"
                  url="[controller: 'userPlaceRelation',
                        action: 'setVisitedAjax',
                        params: [placeId: placeRel.place.id]]"
                        onSuccess="successSetVisited(data)"
                        onFailure="failtureSetVisited(XMLHttpRequest)"
    >

    <div class="modal-body">
        <g:datePicker name="dateVisited" id="dateVisited" value="${new Date()}" precision="day"/>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Отмена</button>
        <g:submitButton class="btn btn-success" name="setVisitedPopupSubminBtn" value="ОК">Save changes</g:submitButton >
    </div>
    </g:formRemote>
</div>
</g:if>

<g:javascript>
    function updatePlacesToVisitTable() {
        ${remoteFunction(
            controller: 'index',
            update: 'place-to-visit-table',
            action: 'getPlacesToVisit'
        )}
    }


    function updatePlacesVisitedTable() {
        ${remoteFunction(
            controller: 'index',
            update: 'place-visited-table',
            action: 'getPlacesVisited'
        )}
    }

    function successSetVisited(data) {

        jQuery('#visited-popup').modal('hide');
        $("#alert #alert-content").html("Место " + data + " отмечено как посещенное!");
        showAlert('alert-success');

        updatePlacesToVisitTable();
        updatePlacesVisitedTable();

    }

    function failtureSetVisited(data) {

        jQuery('#visited-popup').modal('hide');
        $("#alert #alert-content").html("Произошла ошибка!");
        showAlert('alert-error');

        updatePlacesToVisitTable();
        updatePlacesVisitedTable();

    }

</g:javascript>