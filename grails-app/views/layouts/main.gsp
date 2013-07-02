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
    <g:javascript library="jquery" plugin="jquery"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

    <r:require module="bootstrap-css"/>
    <r:require module="bootstrap-js"/>

    <r:require module="application"/>

    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<div id="wrap">

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <div class="well">

                    <g:render template="/layouts/left-menu"/>

                </div>
            </div>

            <div class="span9">
                <div class="well">

                    <g:render template="/layouts/alert"/>
                    <g:layoutBody/>

                </div>
            </div>

        </div>
    </div>

    <div id="push"></div>
</div>

<g:render template="/layouts/footer"/>

<r:layoutResources/>

<sec:ifLoggedIn>
    <g:hiddenField name="userid" id="userid" value="${sec.loggedInUserInfo(field: "id")}"/>
</sec:ifLoggedIn>

</body>
</html>
