<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <g:link class="brand" controller="index">NEED TO VISIT</g:link>
            <div class="navbar-text pull-right">
                <sec:ifNotLoggedIn>
                    <g:link class="navbar-link" controller="users" action="create">Зарегистрироваться</g:link>
                    <span class="divider-vertical"></span>
                    <g:link class="navbar-link" controller="login">Войти</g:link>
                </sec:ifNotLoggedIn>

                <sec:ifLoggedIn>
                    <span class="navbar-text">Добрый день,</span>

                    <g:link class="navbar-link" controller="users" action="edit"
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