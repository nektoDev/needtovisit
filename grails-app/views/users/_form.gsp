<%@ page import="ru.nektodev.needtovisit.Users" %>

<r:require module="passfield"/>
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

<g:formInput bean="usersInstance"
             field="email"
             label="users.email.label"
             defaultLabel="Email"
             required="false">
    <g:textField name="email" id="email" value="${usersInstance?.email}"
                 placeholder="${message([code: 'users.email.label', default: 'example@email.com'])}"/>
</g:formInput>

<g:formInput bean="usersInstance"
             field="firstName"
             label="users.firstName.label"
             defaultLabel="First name"
             required="false">
    <g:textField name="firstName" id="firstName" value="${usersInstance?.firstName}"
                 placeholder="${message([code: 'users.firstName.label', default: 'Иван'])}"/>
</g:formInput>

<g:formInput bean="usersInstance"
             field="lastName"
             label="users.lastName.label"
             defaultLabel="Last name"
             required="false">
    <g:textField name="lastName" id="lastName" value="${usersInstance?.lastName}"
                 placeholder="${message([code: 'users.lastName.label', default: 'Иванов'])}"/>
</g:formInput>

<script type="text/javascript">
    jQuery('#password').passField({
        showWarn: false,
        showTip: false,
        locale: "ru"
    });
</script>

