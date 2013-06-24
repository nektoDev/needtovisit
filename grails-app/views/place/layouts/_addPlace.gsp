<%@ page import="ru.nektodev.needtovisit.PlaceController" %>
<g:formRemote class="" name="addPlaceForm"
              url="[controller: 'place', action: 'saveAjax']"
              style="width: 100%; display: inline-block; margin: 5px 0;"
              onSuccess="successAddPlace(data);"
              onFailure="failureAddPlace(XMLHttpRequest);"
>
    <div class="input-append" style="width: 100%;">
        <input type="text" name="name" style="width: 85%;"
               placeholder="Что хотите посетить? Например: зоопарк, планетарий, Шри-Ланка"/>
        <g:submitButton class="btn btn-success" style="width: 13.7%;" name="addPlace" value="Добавить"/>
    </div>
</g:formRemote>

<g:javascript>
    function updatePlacesToVisitTable() {
        ${remoteFunction(
        controller: 'index',
        update: 'place-to-visit-table',
        action: 'getPlacesToVisit'
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
</g:javascript>



