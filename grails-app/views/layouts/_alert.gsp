<div class="pull-right" style="margin-right: 220px;">
    <div id="alert" style="position: fixed;" class="alert fade" >
        <button type="button" class="close" onclick="hideAlert();">&times;</button>

        <span id="alert-content">
            <g:if test='${flash.message}'>
                <div class='login_message'>${flash.message}</div>
            </g:if>
        </span>
    </div>
</div>

<g:if test='${flash.message}'>
    <script type="text/javascript">
        $(function() {
            showAlert("alert-info");
        })
    </script>
</g:if>