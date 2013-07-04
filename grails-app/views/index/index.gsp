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
        Хотите посетить? <small class="muted"><g:link controller="users"
                                                      action="create">Зарегистрируйтесь</g:link> или <g:link
            controller="login" action="auth">войдите</g:link>, чтобы не забыть сходить или найти компанию</small>
    </h3>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
    <g:render template="/place/layouts/addPlace"/>
</sec:ifLoggedIn>

<g:render id="placesListRender"  template="/place/layouts/placesList" model="[places: placesList]"/>

</body>
</html>
