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

    <style>
    #myCarousel img {
        height: 250px;
        margin: auto;
    }

    .carousel-caption{
        font-size: 80%;

    }

    #myCarousel {
        background-color: #ebebeb;
        box-shadow: 0 0 12px #b8b6b5;
    }

    .container-fluid {
        width: 920px;
        margin: auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 0 12px #dcdad9;
    }
    </style>
</head>

<body>
<div id="wrap">
    <div class="container-fluid">
        <div id="myCarousel" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
            </ol>

            <div class="carousel-inner">
                <div class="item">
                    <img src='${createLink([uri: "/images/bootstrap-mdo-sfmoma-01.jpg"])}' alt="">

                    <div class="carousel-caption">
                        <h4>Зоопарк</h4>

                        <p>Прекрасное место отдыха семьей и с детьми</p>
                    </div>
                </div>

                <div class="item">
                    <img src='${createLink([uri: "/images/bootstrap-mdo-sfmoma-01.jpg"])}' alt="">

                    <div class="carousel-caption">
                        <h4>Кино: Университет монстров</h4>

                        <p>Продолжение великолепного мультфильма о монстрах</p>
                    </div>
                </div>

                <div class="item active">
                    <img src='${createLink([uri: "/images/bootstrap-mdo-sfmoma-01.jpg"])}' alt="">

                    <div class="carousel-caption">
                        <h4>Парк Горького</h4>

                        <p>Бесплатный вход, Wi-fi покрытие, новые зоны, созданные в духе самых современных тенденций дизайна, продуманная программа мероприятий и внимание к людям – все это превратило Парк Горького в эпицентр жизни столицы, сделав его одной из главных точек притяжения как для молодёжи, так и для более взрослой, семейной аудитории.</p>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
        </div>

        <div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <a class="brand" href="#">NEED TO VISIT</a>
                    <div class="navbar-text pull-right">
                        <sec:ifNotLoggedIn>
                            <span class="divider-vertical"></span>
                            <g:link class="navbar-link" controller="login">Войти</g:link>
                        </sec:ifNotLoggedIn>

                        <sec:ifLoggedIn>
                            <span class="navbar-text">Добрый день,</span>

                            <g:link class="navbar-link" controller="user" action="edit"
                                    id="${sec.loggedInUserInfo(field: 'id')}">
                                <sec:username/>
                            </g:link>
                            <span class="divider-vertical"></span>

                            <g:link class="navbar-link" controller="logout">Выйти</g:link>

                        </sec:ifLoggedIn>
                    </div>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li><g:link controller="index">Ваше</g:link></li>
                            <li><g:link controller="place" action="notByUser">Что еще?</g:link></li>
                            <li><g:link controller="place" action="notByUser">Рекомендуем</g:link></li>
                            <li><g:link controller="place" action="list">Все</g:link></li>
                        </ul>
                    </div>
                    <!-- .nav, .navbar-search, .navbar-form, etc -->

                </div>

            </div><!-- /navbar-inner -->
        </div>

        <div class="row-fluid">

            <div class="span9">

                <g:render template="/layouts/alert"/>
                <g:layoutBody/>

            </div>

            <div class="span3">

                <g:render template="/layouts/left-menu"/>

            </div>

        </div>

    </div>
    %{--<div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <div class="well">

                    <g:render template="/layouts/left-menu"/>

                </div>
            </div>

            <div class="span9">
                <div class="well" style="background-color: #ffffff">

                    <g:render template="/layouts/alert"/>
                    <g:layoutBody/>

                </div>
            </div>

        </div>
    </div>--}%



    <div id="push"></div>
</div>

<g:render template="/layouts/footer"/>

<g:javascript>
jQuery(document).ready(function() {
    updatePlacesRecommendedTable()
});


//region UPDATE TABLES
function updatePlacesListTable() {
    ${remoteFunction(
        controller: 'index',
        update: 'places-list-render-wrapper',
        action: 'getPlacesList'
)}
    }
    function updatePlacesRecommendedTable() {
    ${remoteFunction(
            controller: 'index',
            update: 'places-recommended-min-wrapper',
            action: 'getPlacesRecommended'
    )}
    }
    //endregion

    //region PlaceToVisit
    function successLoadVisitedPopup() {
        jQuery('#visited-popup').on('shown', function () {
           $('#comment').focus();
           $('#visited-popup').bind('keydown', function (event) {
               if (event.keyCode == 13 && event.ctrlKey) {
                   $('#visited-popup #setVisitedPopupSubminBtn').click();
               }
           })
       });
       $('#visited-popup').modal('show');
    }

    function failureLoadVisitedPopup() {
        $("#alert #alert-content").html("Произошла ошибка!");
        showAlert('alert-error');
    }
    //endregion

    //region VisitedPopup
    function successSetVisited(data) {

        $('#visited-popup').modal('hide');
        $("#alert #alert-content").html("Место " + data + " отмечено как посещенное!");
        showAlert('alert-success');

        updatePlacesListTable();

    }

    function failtureSetVisited(data) {

        jQuery('#visited-popup').modal('hide');
        $("#alert #alert-content").html("Произошла ошибка!");
        showAlert('alert-error');

        updatePlacesListTable();

    }
    //endregion

    //region PlacesRecommended
    function successAddRelation() {
        updatePlacesRecommendedTable();
        updatePlacesListTable();
    }
    //endregion


    //region ADD PLACE
    function search(request, response) {
        var query = request.term;
    ${remoteFunction(
            controller: 'place',
            action: 'search',
            params: "'max=5&q=' + query",
            onSuccess: 'response(data);'
    )}
    }

    function successAddPlace(data) {

        $("#alert #alert-content").html("Место " + data + " успешно добавлено!");
        showAlert('alert-success');

        updatePlacesListTable();
        resetAddPlaceForm();
    }

    function resetAddPlaceForm() {
        document.getElementById('addPlaceForm').reset();

        $('#date-to-visit-hidden').val("");
        $('#add-date-icon').showHtml("");
        $('#add-date-icon').css("background-image", "url('images/calendar-grey.png')");
    }

    function failureAddPlace(data) {
        $("#alert #alert-content").html("Не удалось добавить место!");
        showAlert('alert-error');
        updatePlacesListTable();
    }
    //endredion
</g:javascript>


<r:layoutResources/>

<sec:ifLoggedIn>
    <g:hiddenField name="userid" id="userid" value="${sec.loggedInUserInfo(field: "id")}"/>
</sec:ifLoggedIn>

</body>
</html>
