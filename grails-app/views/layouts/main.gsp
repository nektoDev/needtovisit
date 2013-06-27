<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="NeedToVisit"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <g:javascript library="jquery" plugin="jquery"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <r:require module="bootstrap-css"/>
    <r:require module="bootstrap-js"/>
    <r:require module="bootstrap-typeahead"/>

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<div id="wrap">
    <g:render template="/layouts/header"/>

    <div class="container">


    <div class="well">
        <g:render template="/layouts/alert"/>
            <g:layoutBody/>

        </div>
    </div>
    <div id="push"></div>
</div>

<g:render template="/layouts/footer"/>

<g:javascript library="application"/>

<r:layoutResources/>

<sec:ifLoggedIn>
    <g:hiddenField name="userid" id="userid" value="${sec.loggedInUserInfo(field: "id")}"/>
</sec:ifLoggedIn>

</body>
</html>
