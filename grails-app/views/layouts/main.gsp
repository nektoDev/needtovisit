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
    <r:require module="datepicker"/>
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<div id="wrap">

    <div class="container-fluid">

        <div class="span2">
            HELLO!
            <ul class="nav nav-list">
                <li><i class="pull-left icon-book"></i><a href="https://svn.otr.ru/repos/urksvn/db04/%D0%9C%D0%A1%D0%9E%D0%A1-2/">Documentation</a></li>
                <li><i class="pull-left icon-list-alt"></i><a href="http://hs-c06-ws01.pds.otr.ru:13080/pages/viewpage.action?pageId=11337764">Wiki</a></li>
                <li><i class="pull-left icon-trash"></i><a href="https://svn.otr.ru/repos/urksvn/db04/AlfaMSOS2/">Project sources</a></li>
                <li><i class="pull-left icon-check"></i><a href="http://172.31.199.219/testlink/">TestLink</a></li>
                <li><i class="pull-left icon-list"></i><a href="https://irbis.otr.ru:8443/jira/browse/MS">JIRA</a></li>
                <li><i class="pull-left icon-wrench"></i><a href="http://172.31.199.218/">BuildServer</a></li>
                <li><i class="pull-left icon-eye-open"></i><a href="http://testjmb.alfabank.ru/CS/MonLog/">MonLog</a></li>
                <li><i class="pull-left icon-signal"></i><a href="/smsservice.html">SMSService</a></li>
            </ul>
        </div>

        <div id="main-content" class="span10">
            <div class="well">
                <g:render template="/layouts/alert"/>
                <g:layoutBody/>
            </div>
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
