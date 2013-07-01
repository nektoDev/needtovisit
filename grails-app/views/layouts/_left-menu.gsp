<style type="text/css">
.brand {
    text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
    font-weight: bold;
    text-transform: uppercase;
    color: #999;
    font-size: 200%;
    margin: 10px 0;
    display: block;
}

.brand:hover {
    text-decoration: none;
    color: #999;
}

.greeting-section {
    font-size: 80%;
    margin-bottom: 10px;
}

.greeting-section a {
    text-decoration: none;
}
.nav-list {
    padding-right: 0;
    padding-left: 5px;
}
.nav-list .nav-header {
    margin-left: -25px;
}

.nav-list .divider {
    margin-left: -10px;
}

</style>

<div class="well">

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
                <div class="label">
                    <sec:username/>
                </div>
            </g:link>

            <g:link class="pull-right" controller="logout">Выйти</g:link>

        </sec:ifLoggedIn>

    </div>

    <ul class="nav nav-list">

        <li class="nav-header">Навигация</li>
        <li><g:link controller="index">Home</g:link></li>
        <li><g:link controller="place" action="list">Places</g:link></li>

        <li class="divider"></li>
        <li class="nav-header">Рекомендуем:</li>
        <li>
            <g:render id="newPlacesRender" template="/place/layouts/newPlaces"/>
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
</div>
