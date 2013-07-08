<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main"/>
    <title>NeedToVisit</title>
 <style>
 .page-header {
     position: relative;

     /* Recent browsers */
     background: -webkit-gradient(
         linear,
         left top, right top,
         from(rgb(170, 11, 14)),
         to(rgba(255,255,255,0))
     );
     background: -webkit-linear-gradient(
         left,
         rgb(170, 11, 14),
         rgba(255,255,255,0)
     );
     background: -moz-linear-gradient(
         left,
         rgb(170, 11, 14),
         rgba(255,255,255,0)
     );
     background: -o-linear-gradient(
         left,
         rgb(170, 11, 14),
         rgba(255,255,255,0)
     );
     background: linear-gradient(
         left,
         rgb(170, 11, 14),
         rgba(255,255,255,0)
     );

     /*background: rgb(170, 11, 14);*/
     color: #fff;
     text-align: left;
     font-size: 24px;
     padding: 0.8em 1.6em; /* Adjust to suit */
     /* Based on 24px vertical rhythm. 48px bottom margin - normally 24 but the page-header 'graphics' take up 24px themselves so we double it. */
     margin: 0 auto 1em -1.8em;
 }
 .page-header:before {
     left: -2em;
     border-right-width: 1.5em;
     border-left-color: transparent;
 }

 .page-header .page-header-content:before{
     content: "";
     position: absolute;
     display: block;
     border-style: solid;
     border-color: #75181b transparent transparent transparent;
     bottom: -1em;
 }
 .page-header .page-header-content:before {
     left: 0;
     border-width: 1em 0 0 1em;
 }

 </style>
</head>

<body>
<div class="page-header"><span class="page-header-content">Ваши места</span></div>

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
