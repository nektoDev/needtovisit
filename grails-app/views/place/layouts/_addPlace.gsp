<%@ page import="ru.nektodev.needtovisit.PlaceController" %>

<r:require module="datepicker"/>
<r:require module="autocomplete"/>

<g:formRemote class="" name="addPlaceForm"
              url="[controller: 'place', action: 'saveAjax']"
              style="width: 100%; display: inline-block; margin: 5px 0;"
              onSuccess="successAddPlace(data);"
              onFailure="failureAddPlace(XMLHttpRequest);">
    <div class="input-append" style="width: 100%;">
        <input id="add-place-input"
               type="text"
               name="name" style="width: 85%;"
               placeholder="Что хотите посетить? Например: зоопарк, планетарий, Шри-Ланка"/>
        <g:submitButton class="btn btn-success" style="width: 13.7%" name="addPlace" value="Добавить"/>
        <a href="#" data-date-format="dd.mm.yyyy" data-date="${formatDate([format: "dd.MM.yyyy", date: new Date()])}" id="add-date-icon">text</a>
    </div>
</g:formRemote>
<g:javascript>


    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    jQuery(function () {
        autocompleteAddPlace();

        $('#add-date-icon').datepicker({
        onRender: function(date) {
            return date.valueOf() < now.valueOf() ? 'disabled' : '';
        },
        weekStart: 1

        }).on('changeDate', function(ev) {
            $('#add-date-icon').datepicker('hide');
            $('#add-date-icon').text($('#add-date-icon').data('date'));
            $('#add-place-input').focus();
        });
    });

    function search(request, response) {
        var query = request.term;
        ${remoteFunction(
            controller: 'place',
            action: 'search',
            params: "'max=5&q=' + query",
            onSuccess: 'response(data);'
        )}
    }

    function successAddPlace(data) {

        $("#alert #alert-content").html("Место " + data + " успешно добавлено!");
        showAlert('alert-success');

        updatePlacesToVisitTable();
        document.getElementById('addPlaceForm').reset();
    }

    function failureAddPlace(data) {

        $("#alert #alert-content").html("Не удалось добавить место!");
        showAlert('alert-error');
        updatePlacesToVisitTable();
    }

    function updatePlacesToVisitTable() {
    ${remoteFunction(
            controller: 'index',
            update: 'place-to-visit-table',
            action: 'getPlacesToVisit'
    )}
    }

</g:javascript>



