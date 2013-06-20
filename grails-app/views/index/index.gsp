<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main"/>
    <title>NeedToVisit</title>
    <g:resource dir="js" file="index.js"/>
</head>
<body>
<div class="page-header"><h1>Заголовок страницы</h1></div>
<sec:ifNotLoggedIn>
    <h3>
        Хотите посетить?<small class="muted"><g:link controller="users" action="add">Зарегистрируйтесь</g:link> или <g:link
                    controller="login" action="auth">войдите</g:link>, чтобы не забыть сходить или найти компанию</small>
    </h3>
    <g:render id="newPlacesRender" template="newPlaces" model="[places: newPlaces]"/>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>


    <h3>Уже посетили?</h3>
    <g:render id="placesToVisitRender" template="placesToVisit" model="[places: placesToVisit]"/>

    <div class="row">

        <div class="span5">
            <h3>Хотите посетить?</h3>

            <g:render id="newPlacesRender" template="newPlaces" model="[places: newPlaces]"/>
        </div>
        <div class="span1 divider"></div>
        <div class="span5">
            <h3>Еще разок?</h3>
            <g:render id="placesVisitedRender" template="placesVisited" model="[placesRel: placesVisited]"/>
        </div>

    </div>



</sec:ifLoggedIn>
<g:javascript>
    function successAddRelation() {
        ${remoteFunction(controller: 'index',
        update: 'place-new-table',
        action: 'getNewPlaces'
)}
    ${remoteFunction(controller: 'index',
            update: 'place-to-visit-table',
            action: 'getPlacesToVisit'
    )}
    }
</g:javascript>
</body>
</html>
