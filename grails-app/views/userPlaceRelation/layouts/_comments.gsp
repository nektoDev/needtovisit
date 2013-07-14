<style>

</style>

<div class="comments">
    <div class="comments-title">
        Комментарии:
    </div>

    <div class="comment-body">
        <g:each in="${relations}" status="i" var="rel">
            <g:if test="${rel?.comment != null && !rel?.comment?.isEmpty()}">
                <div class="comment-user"><g:link controller="users" action="show"
                                                  params="[id: rel.user.id]">${rel.user.username}</g:link></div>

                <div class="comment-content">${rel.comment}</div>

                <div class="comment-footer">${rel.dateVisited}</div>
            </g:if>
        </g:each>
    </div>
</div>