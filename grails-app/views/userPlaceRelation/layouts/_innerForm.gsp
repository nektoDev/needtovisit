<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation" %>
<g:formRemote class="form form-horizontal" style="" name="innerRelationForm" url="[controller: 'userPlaceRelation', action: 'update']">
    <h4>${userPlaceRelationInstance?.place?.name}
    <g:if test="${userPlaceRelationInstance?.dateVisited}">
    <small><i>
        Вы уже тут были ${formatDate([date: userPlaceRelationInstance?.dateVisited, format: 'dd.MM.yyyy'])}
    </i></small>
</g:if>
    </h4>

<div class="control-group ${hasErrors(bean: userPlaceRelationInstance, field: 'visited', 'error')}">
    <label class="control-label" for="dateToVisit">
        <g:message code="userPlaceRelation.dateToVisit.label" default="Запланировано:"/>

    </label>
   <div class="controls">
       <g:textField name="dateToVisit" value="${formatDate([date: userPlaceRelationInstance?.dateToVisit, format: 'dd.MM.yyyy'])}"/>
   </div>
</div>

<div class="btn-zone">
    <g:submitButton name="submitInner" value="Сохранить" class="btn btn-primary"/>
    <g:submitToRemote name="delete" value="Убрать" class="btn btn-danger"/></div>
</g:formRemote>
