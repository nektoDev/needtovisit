<h6><g:link class="brand" controller="index">Need To Visit</g:link></h6>

<div class="greeting-section">
    <sec:ifNotLoggedIn>
        <g:link controller="users" action="create">Зарегистрироваться</g:link>

        <g:link class="pull-right" controller="login">Войти</g:link>
    </sec:ifNotLoggedIn>

    <sec:ifLoggedIn>
        <span class="">Добрый день,</span>

        <g:link class="" controller="users" action="edit"
                id="${sec.loggedInUserInfo(field: 'id')}">

                <sec:username/>

        </g:link>

        <g:link class="pull-right" controller="logout">Выйти</g:link>

    </sec:ifLoggedIn>

</div>

<ul class="nav nav-list">

    <li class="nav-header">Навигация</li>
    <li><g:link controller="place" action="list">Что еще посетить</g:link></li>
    <li><g:link controller="place" action="list">Хотите посетить</g:link></li>
    <li><g:link controller="place" action="list">Уже посетили</g:link></li>
    <li><g:link controller="place" action="list">Рекомендуем посетить</g:link></li>

    <li class="divider"></li>
    <li class="nav-header">Рекомендуем:</li>
    <li>
        <g:render id="places-recommended-min-render" template="/place/layouts/placesRecommendedMin"/>
    </li>

    <li class="nav-header">Календарь ваших событий</li>
    <li>
        <div style="width: 215px; height: 215px; background-color: white; border: 1px solid black;"></div>
    </li>

    <li class="nav-header">Реклама</li>
    <li>
        <div style="width: 215px; height: 215px; background-color: white; border: 1px solid black;"></div>
    </li>

</ul>

