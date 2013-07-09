<!DOCTYPE html>
<html>

<head>
    <parameter name="header-page" value="Ваши места"/>

        <meta name="layout" content="main"/>
    <title>NeedToVisit</title>
</head>

<body>

<sec:ifNotLoggedIn>
    <h3>
        Хотите посетить? <small class="muted"><g:link controller="users"
                                                      action="create">Зарегистрируйтесь</g:link> или <g:link
            controller="login" action="auth">войдите</g:link>, чтобы не забыть сходить или найти компанию</small>
    </h3>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
    <g:render template="/place/layouts/addPlace"/>
</sec:ifLoggedIn>

<div id="places-list-render-wrapper">
    <g:render id="placesListRender"  template="/place/layouts/placesList" model="[places: placesList]"/>
</div>

</body>
</html>
