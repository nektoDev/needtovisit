<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
    <r:require module="login"/>
</head>

<body>

<form class="form-signin" action='${postUrl}' method='POST' id='loginForm'>
    <h2 class="form-signin-heading"><g:message code="springSecurity.login.header"/></h2>

    <g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
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
        Sign in
    </button>
</form>

<script type='text/javascript'>
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
</script>
</body>
</html>
