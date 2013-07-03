<%@ page import="ru.nektodev.needtovisit.PlaceController" %>

<r:require module="datepicker"/>
<r:require module="autocomplete"/>

<style type="text/css" xmlns="http://www.w3.org/1999/html">
#add-date-icon {
    display: block;
    height: 20px;
    padding: 2px 2px 2px 22px;
    margin: 3px 0;
    background-color: lightgrey; /* Replace with your own image */
    outline: 1px solid #ccc;
    outline-offset: 2px;
    border-radius: 6px;
    font-size: 14px;
    color: #333;
    text-decoration: none !important;
}

#add-place-input {
    border-radius: 0;
    borde
}
</style>

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
                           name="name" style="width: 85%;"
                           placeholder="Что хотите посетить? Например: зоопарк, планетарий, Шри-Ланка"/>
                    <g:submitButton class="btn btn-success" style="width: 13.7%" name="addPlace" value="Добавить"/>
                </td>
            </tr>

        </table>
    </div>

    <g:hiddenField name="dateToVisit" id="date-to-visit-hidden" value=""/>
</g:formRemote>
<script type="text/javascript">
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    jQuery(function () {
        autocompleteAddPlace();

        $('#add-date-icon').datepicker({
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            },
            weekStart: 1

        }).on('changeDate',
                function (ev) {

                    $('#add-date-icon').text($('#add-date-icon').data('date'));
                    $('#date-to-visit-hidden').val($('#add-date-icon').data('date'));
                    $('#add-date-icon').datepicker('hide');
                    $('#add-place-input').focus();
                });
    });
</script>



