<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main"/>
    <title>NeedToVisit</title>

</head>
<body>
<div class="page-header"><h1>Заголовок страницы</h1></div>
<sec:ifNotLoggedIn>
    <h3>
        Хотите посетить? <small class="muted"><g:link controller="users" action="create">Зарегистрируйтесь</g:link> или <g:link
                    controller="login" action="auth">войдите</g:link>, чтобы не забыть сходить или найти компанию</small>
    </h3>
    <g:render id="newPlacesRender" template="/place/layouts/newPlaces" model="[places: newPlaces]"/>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
    <g:render template="/place/layouts/addPlace"/>

    <h3>Уже посетили?</h3>
    <g:render id="placesToVisitRender" template="/place/layouts/placesToVisit" model="[places: placesToVisit]"/>


    <g:javascript>
        jQuery(function () {

            autocompleteAddPlace();

        });
    </g:javascript>
</sec:ifLoggedIn>
</body>
</html>
