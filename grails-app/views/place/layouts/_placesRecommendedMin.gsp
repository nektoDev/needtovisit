<style>
.place-recommended-list {
    border: 1px solid #d4d4d4;;
    border-radius: 5px;
    height: 100px;
    padding: 5px;
    margin-bottom: 20px;
    background-color: #fdfdfd;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.065);;
}

.recommended-title {
    text-transform: uppercase;
    font-weight: bold;
    color: #999999;
    width: 100%;
}

.place-recommended {
    width: 80px;
    display: inline-block;
    border: 1px solid black;
    margin: 5px;
    height: 90px;
    position: relative;
}

.place-recommended-caption {
    position: absolute;
    top: 0;
    padding: 3px;
    right: 0;
    left: 0;
    color: #777;
    background: rgba(255, 255, 255, 0.73);
}

.place-recommended-controls {
    position: absolute;
    bottom: 0;
    padding: 3px;
    right: 0;
    left: 0;
    color: #777;
    background: rgba(255, 255, 255, 0.73);
    opacity: 0;

    -webkit-transition: 1s;
    -moz-transition: 1s;
    -ms-transition: 1s;
    -o-transition: 1s;
    transition: 1s;
}

.place-recommended:hover .place-recommended-controls {
    opacity: 1;
    z-index: 100;
}
</style>
<g:each in="${places}" status="i" var="placeInstance">
    <div class="place-recommended">
        <g:link controller="place" action="show" id="${placeInstance.id}">
            <div class="place-recommended-caption">${placeInstance.name}</div>
            <img src='${createLink([uri: "/images/nophoto-80x90.png"])}' style="" alt="">
        </g:link>

        <div class="place-recommended-controls control">
            <img src="${createLink([uri: "/images/add.png"])}"
                 onclick="${remoteFunction(controller: 'index',
                         action: 'addUserPlaceRelation',
                         params: [place: placeInstance.id],
                         onSuccess: 'successAddRelation();'
                 )}"
                 class="pull-right">
        </div>
    </div>
</g:each>
