<%@ page import="ru.nektodev.needtovisit.PlaceController" %>
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
        <g:submitButton class="btn btn-success" style="width: 13.7%;" name="addPlace" value="Добавить"/>
    </div>
</g:formRemote>

<g:javascript>
    jQuery(function() {

    jQuery( "#add-place-input" ).autocomplete({
        minLength: 0,
        source: function(request, response) {
            search(request, response);
        },
        focus: function( event, ui ) {
            $( "#add-place-input" ).val( ui.item.name );
            return false;
        },
        select: function( event, ui ) {
            $( "#add-place-input" ).val( ui.item.name );
            return false;
        }
    })
    .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
        var result = null;
        var users = "";
        item.userRelation.forEach(function(rel) {
            if (rel.user.id == 3) {
                result = $( "<li class='ui-state-disabled'>" )
                    .append( "<a>" + item.name + "<small class='pull-right'><i>Вы уже хотите посетить это место</i></small></a></li>");
            }
            users += " <span class='label'>" + rel.user.username + "</span>";
        });

        if (result == null) {

            result = $( "<li>" )
                .append( "<a>" + item.name + "<small class='pull-right muted'><i>Хотят посетить: " + users + "</i></small></a></li>");
        }

        result.append("<li class='ui-menu-divider'></li>");
        return result.appendTo( ul );
    };

});

    function updatePlacesToVisitTable() {
        ${remoteFunction(
        controller: 'index',
        update: 'place-to-visit-table',
        action: 'getPlacesToVisit'
)}
    }

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
</g:javascript>



