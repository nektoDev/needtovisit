<%@ page import="ru.nektodev.needtovisit.Place" %>



<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="place.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${placeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'visited', 'error')} ">
	<label for="visited">
		<g:message code="place.visited.label" default="Visited" />
		
	</label>
	<g:checkBox name="visited" value="${placeInstance?.visited}" />
</div>

