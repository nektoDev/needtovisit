<%@ page import="ru.nektodev.needtovisit.PlaceController" %>

<div class="row">
    <g:formRemote class="navbar-search span12" name="addPlaceForm"
                  url="[controller: 'place', action: 'saveAjax']"
                  onSuccess="updatePlaceToVisitTable(); document.getElementById('addPlaceForm').reset();">
        <div class="input-append">
            <input type="text" name="name" class="span10"
                   placeholder="Что хотите посетить? Например: зоопарк, планетарий, Шри-Ланка"/>
            <g:submitButton class="btn span2 btn-success" name="addPlace"/>
        </div>
    </g:formRemote>
</div>

