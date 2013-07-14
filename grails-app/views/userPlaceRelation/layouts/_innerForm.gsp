<%@ page import="ru.nektodev.needtovisit.UserPlaceRelation" %>

<g:formRemote class="form form-horizontal form-inner" name="innerRelationForm"
              url="[controller: 'userPlaceRelation', action: 'update']">

    <g:if test="${!userPlaceRelationInstance.visited}">
        <div class="control-group ${hasErrors(bean: userPlaceRelationInstance, field: 'visited', 'error')}">
            <label class="control-label" for="dateToVisit">
                <g:message code="userPlaceRelation.dateToVisit.label" default="Запланировано:"/>

            </label>

            <div class="controls">
                <g:textField name="dateToVisit"
                             value="${formatDate([date: userPlaceRelationInstance?.dateToVisit, format: 'dd.MM.yyyy'])}"/>
            </div>

        </div>

        <div class="btn-zone">
            <g:submitButton name="submitInner" value="Сохранить" class="btn btn-primary"/>
            <g:submitToRemote name="delete" value="Убрать" class="btn btn-danger"/>
        </div>
    </g:if>
    <g:else>
        <div class="btn-zone">
            <g:submitButton name="submitInner" value="Еще раз" class="btn btn-primary"/>
        </div>
    </g:else>
</g:formRemote>



<g:render template="layouts/comments" model="[relations: relations]"/>
