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
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
    <g:render template="/place/layouts/addPlace"/>
</sec:ifLoggedIn>

<g:render id="placesToVisitRender" template="/place/layouts/placesToVisit" model="[places: placesList]"/>

<g:javascript>
//region PlacesRecommended
    jQuery(document).ready(function() {
        updatePlacesRecommendedTable()
    });

    function updatePlacesToVisitTable() {
        ${remoteFunction(
        controller: 'index',
        update: 'place-to-visit-table',
        action: 'getPlacesToVisit'
)}
    }

    function updatePlacesRecommendedTable() {
    ${remoteFunction(
            controller: 'index',
            update: 'place-recommended-table',
            action: 'getPlacesRecommended'
    )}
    }

    function successAddRelation() {

        updatePlacesRecommendedTable();
        updatePlacesToVisitTable();
    }
//endregion

//region PlaceToVisit
function successLoadVisitedPopup() {
    jQuery('#visited-popup').on('shown', function () {
       jQuery('#comment').focus();
       jQuery('#visited-popup').bind('keydown', function (event) {
           if (event.keyCode == 13 && event.ctrlKey) {
               jQuery('#visited-popup #setVisitedPopupSubminBtn').click();
           }
       })
   });
   jQuery('#visited-popup').modal('show');
}

function failureLoadVisitedPopup() {
    jQuery("#alert #alert-content").html("Произошла ошибка!");
    showAlert('alert-error');
}
//endregion
</g:javascript>

</body>
</html>
