<%@ page import="ru.nektodev.needtovisit.Users" %>

<div class="control-group fieldcontain ${hasErrors(bean: usersInstance, field: 'username', 'error')} required">

    <label for="username" class="control-label">
        <g:message code="users.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:textField name="username" required="" value="${usersInstance?.username}"
                     placeholder="${message([code: 'users.username.label', default: 'Username'])}"/>
    </div>

</div>

<div class="fieldcontain control-group ${hasErrors(bean: usersInstance, field: 'password', 'error')} required">
    <label for="password" class="control-label">
        <g:message code="users.password.label" default="Password"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:textField name="password" id="password" required="" value="${usersInstance?.password}"
                     placeholder="${message([code: 'users.password.label', default: 'Password'])}"/>
    </div>
</div>

<g:javascript>
    jQuery('#password').passField({
        showWarn: false,
        showTip: false,
        locale: "ru"
    });
</g:javascript>

