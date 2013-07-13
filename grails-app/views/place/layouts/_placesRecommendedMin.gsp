<style>

</style>
<g:each in="${places}" status="i" var="placeInstance">
    <div class="place-recommended">
        <g:link controller="place" action="show" id="${placeInstance.id}">
            <div class="place-recommended-caption">${placeInstance.name}</div>
            <img src='${createLink([uri: "/images/nophoto-80x90.png"])}' style="" alt="">
        </g:link>

        <div class="place-recommended-controls control">
            <i class="icon-plus icon-large pull-right"
               onclick="${remoteFunction(controller: 'index',
                       action: 'addUserPlaceRelation',
                       params: [place: placeInstance.id],
                       onSuccess: 'successAddRelation();'
               )}"
            ></i>
        </div>
    </div>
</g:each>
