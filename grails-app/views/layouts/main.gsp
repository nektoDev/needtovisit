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
    %{--

        <r:require module="application"/>
    --}%

    <g:layoutHead/>
    <r:layoutResources/>

    <style>
    #myCarousel img {
        height: 300px;
        margin: auto;
    }

    #myCarousel {
        background-color: lightgrey;
        box-shadow: 0 0 12px #b8b6b5;
    }

    .container-fluid {
        width: 1000px;
        margin: auto;
        padding-top: 20px;
        background-color: white;
        box-shadow: 0 0 12px #dcdad9;
    }
    </style>
</head>

<body>
<div id="wrap">
    <div class="container-fluid">
        <div id="myCarousel" class="carousel slide" style="height: 300px">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
            </ol>

            <div class="carousel-inner">
                <div class="item">
                    <img src='${createLink([uri: "/images/bootstrap-mdo-sfmoma-01.jpg"])}' alt="">

                    <div class="carousel-caption">
                        <h4>First Thumbnail label</h4>

                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    </div>
                </div>

                <div class="item">
                    <img src='${createLink([uri: "/images/bootstrap-mdo-sfmoma-01.jpg"])}' alt="">

                    <div class="carousel-caption">
                        <h4>Second Thumbnail label</h4>

                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    </div>
                </div>

                <div class="item active">
                    <img src='${createLink([uri: "/images/bootstrap-mdo-sfmoma-01.jpg"])}' alt="">

                    <div class="carousel-caption">
                        <h4>Third Thumbnail label</h4>

                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
        </div>

        <div class="row-fluid">


            <div class="span9">
                <div class="well" style="background-color: #ffffff">

                    <g:render template="/layouts/alert"/>
                    <g:layoutBody/>

                </div>
            </div>

            <div class="span3">
                <div class="well">

                    <g:render template="/layouts/left-menu"/>

                </div>
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
