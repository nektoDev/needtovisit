<!DOCTYPE html>
<html>

<head>
    <parameter name="header-page" value="Список JustGO "/>

        <meta name="layout" content="main"/>
    <title>NeedToVisit</title>
</head>

<body>
<sec:ifNotLoggedIn>
    <h4>
        Хотите посетить? <small class="muted"><g:link controller="users"
                                                      action="create">Зарегистрируйтесь</g:link> или <g:link
            controller="login" action="auth">войдите</g:link>, чтобы не забыть сходить или найти компанию</small>
    </h4>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
    <div class="recommended-title">Рекомендуем</div>
    <div id="place-recommended-table" class="place-recommended-list">
        <g:render template="/place/layouts/placesRecommendedMin"/>
    </div>

    <g:render template="/place/layouts/addPlace"/>
</sec:ifLoggedIn>

<div id="places-list-render-wrapper">
    <g:render id="placesListRender"  template="/place/layouts/placesList" model="[places: placesList]"/>
</div>

</body>
</html>
