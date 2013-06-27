<%@ page import="ru.nektodev.needtovisit.Users" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'users.label', default: 'Users')}"/>
    <title><g:message code="registration"/></title>
</head>

<body>
<div class="page-header"><h1><g:message code="registration" default="Registration"/></h1></div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<g:hasErrors bean="${usersInstance}">

    <div class='alert alert-error'><ul role="alert">
        <g:eachError bean="${usersInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">
                    data-field-id="${error.field}"
                </g:if>>

                <g:message error="${error}"/>
            </li>
        </g:eachError>
    </ul></div>

</g:hasErrors>

<g:form class="form-horizontal" action="save" >
    <fieldset class="form">
        <g:render template="form"/>
    </fieldset>

    <fieldset class="buttons">
        <g:submitButton name="create" class="btn btn-success"
                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
    </fieldset>
</g:form>

</body>
</html>
