<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">

            <strong>
                <a class="brand" href="${createLink(uri: '/')}" data-original-title>Need To Visit</a>

                <div class="nav-collapse collapse">
                    <div class="navbar-text pull-right">
                        <sec:ifNotLoggedIn>
                        %{--<g:link controller="user" action="create"><g:message code="register"/></g:link>--}%
                            <span class="divider-vertical"></span>
                            <g:link class="navbar-link" controller="users" action="create">Регистрация</g:link>
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

                    <ul class="nav">

                        <li class="active"><a href="#">Home</a></li>
                        <li><g:link controller="place">Места</g:link></li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li class="nav-header">Nav header</li>
                                <li><a href="#">Separated link</a></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </strong>

            <!--/.nav-collapse -->
        </div>
    </div>
</div>


