<%@ page import="ru.nektodev.needtovisit.PlaceController" %>
<r:require module="datepicker"/>
<r:require module="autocomplete"/>

<g:formRemote class="" name="addPlaceForm"
              url="[controller: 'place', action: 'saveAjax']"
              style="width: 100%; display: inline-block; margin: 5px 0;"
              onSuccess="successAddPlace(data);"
              onFailure="failureAddPlace(XMLHttpRequest);">
    <div class="input-append" style="width: 100%;">
        <table>
            <tr>
                <td style="width: 1%; vertical-align: middle">
                    <a href="#" data-date-format="dd.mm.yyyy"
                       data-date="${formatDate([format: "dd.MM.yyyy", date: new Date()])}" id="add-date-icon"></a>
                </td>

                <td>
                    <input id="add-place-input"
                           type="text"
                           name="name" style="width: 80%;"
                           placeholder="Что хотите посетить? Например: зоопарк, планетарий, Шри-Ланка"/>
                    <g:submitButton class="btn btn-primary" style="width: 18.5%" name="addPlace" value="Добавить"/>
                </td>
            </tr>

        </table>
    </div>

    <g:hiddenField name="userRelation.dateToVisit" id="date-to-visit-hidden"
                   value="${datePicker(format: "dd.MM.yyyy")}"/>
</g:formRemote>
<script type="text/javascript">
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    jQuery(function () {
        autocompleteAddPlace();

        $('#add-date-icon').datepicker({
            startDate: now,
            weekStart: 1

        }).on('changeDate',
                function (ev) {

                    $('#add-date-icon').showHtml($(this).data('date'));
                    $('#add-date-icon').css("background-image", "url('images/calendar-blue.png')");

                    $('#date-to-visit-hidden').val($('#add-date-icon').data('date'));
                    $('#add-date-icon').datepicker('hide');
                    $('#add-place-input').focus();
                });
    });


    (function ($) {
        $.fn.showHtml = function (html, speed, callback) {
            return this.each(function () {
                var el = $(this);

                var finish = {width: this.style.width, height: this.style.height};

                var cur = {width: el.width() + 'px', height: el.height() + 'px'};

                el.html(html);

                var next = {width: el.width() + 'px', height: el.height() + 'px'};

                el.css(cur)
                        .animate(next, speed, function () {
                            el.css(finish);
                            if ($.isFunction(callback)) callback();
                        });
            });
        };


    })(jQuery);
</script>



