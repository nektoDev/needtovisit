<%@ page import="ru.nektodev.needtovisit.PlaceController" %>
<div class="navbar">
     <div class="navbar-inner">
        <div class="brand span3">Что хотите посетить?</div>
        <g:formRemote class="navbar-search pull-left"  name="addPlaceForm" url="[controller: 'place', action: 'saveAjax']" onSuccess="updatePlaceToVisitTable(); document.getElementById('addPlaceForm').reset();">
            <input type="text" name="name" class="span6 search-query" placeholder="Например: зоопарк, планетарий, Шри-Ланка"/>
            <g:submitButton class="btn span2 btn-success" name="addPlace"/>
        </g:formRemote>
    </div>
</div>