<!-- Modal -->
<g:if test="${placeRel != null}">
    <div id="visited-popup" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="tits"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

            <h1 id="visited-popup-header-content"><g:img dir="images"
                                                         file="place-default.jpg"/> ${placeRel?.place?.name}</h1>
        </div>
        <g:formRemote id="save-visited-form"
                      name="saveVisited"
                      url="[controller: 'userPlaceRelation',
                              action: 'setVisitedAjax',
                              params: [placeId: placeRel.place.id, visited: true]]"
                      onSuccess="successSetVisited(data)"
                      onFailure="failtureSetVisited(XMLHttpRequest)">

            <div class="modal-body">
                <label for="dateVisited" id="date-visited-label">Когда посетили?</label>
                <g:datePicker name="dateVisited" id="dateVisited" value="${new Date()}" precision="day"/>
                <label for="dateVisited" id="date-visited-label">
                    <g:if test="${placeRel?.comment == null || placeRel?.comment?.isEmpty()}">
                        Как впечатления?
                    </g:if>
                    <g:else>
                        Хотите что нибудь добавить к старым впечатлениям?
                    </g:else>
                </label>
                <g:textArea id="comment" name="comment" rows="3" class="span6" value="${placeRel?.comment}"/>
            </div>

            <div class="modal-footer">
                <small class="muted pull-left" style="margin: 5px 0;"><i>Ctrl+Enter для сохранения</i></small>
                <button class="btn" data-dismiss="modal" aria-hidden="true">Отмена</button>
                <g:submitButton class="btn btn-primary" name="setVisitedPopupSubminBtn" id="setVisitedPopupSubminBtn"
                                value="ОК"/>
            </div>
        </g:formRemote>
    </div>
</g:if>
