<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
    <parameter name="header-page" value="${message(code: 'springSecurity.login.header')}"/>

</head>

<body>

<form class="form-signin" action='${postUrl}' method='POST' id='loginForm'>

    <g:if test='${flash.message}'>
        <div class='alert alert-error'>${flash.message}</div>
    </g:if>

    <input id='username' name='j_username' type="text" class="input-block-level"
           placeholder="<g:message code="springSecurity.login.username.label"/>">
    <input id='password' name='j_password' type="password" class="input-block-level"
           placeholder="<g:message code="springSecurity.login.password.label"/>">

    <label class="checkbox">
        <input type="checkbox" name='${rememberMeParameter}' value="remember-me"
               <g:if test='${hasCookie}'>checked='checked'</g:if>>
        <g:message code="springSecurity.login.remember.me.label"/>
    </label>

    <button class="btn btn-large btn-primary" type="submit"
            value='${message(code: "springSecurity.login.button")}'>
        Войти
    </button>
</form>

<script type='text/javascript'>
    jQuery(document).ready(function () {
        document.forms['loginForm'].elements['j_username'].focus();

        jQuery("#password").passField({
            acceptRate: 0,
            showGenerate: false,
            showWarn: false,
            showTip: false
        });
    });


</script>
</body>
</html>
