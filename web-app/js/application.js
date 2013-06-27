/*
 if (typeof jQuery !== 'undefined') {
 (function($) {
 $('#alert').ajaxStart(function() {
 $(this).html("Wait...Loading...")
 $(this).fadeIn();
 }).ajaxStop(function() {
 //	$(this).fadeOut();
 }).ajaxError(function(event, jqxhr, settings, exception) {
 $(this).html(event + " \n " + jqxhr + " \n " + settings+ " \n " + exception);
 $(this).removeClass("alert-success");
 $(this).removeClass("alert-info");
 $(this).addClass("alert-error");
 });
 })(jQuery);
 }
 */

var previousAlertClass = "class"
function showAlert(clazz) {
    var $alert = $('#alert');
    $alert.removeClass(previousAlertClass);
    previousAlertClass = clazz;

    $alert.addClass(clazz);
    $alert.addClass('in');

    setTimeout(function () {
        hideAlert();
    }, 15000);
}

function hideAlert() {
    var $alert = $('#alert');
    $alert.removeClass('in');
    $alert.addClass('out');
}


//autocomplete
function autocompleteAddPlace() {
    jQuery("#add-place-input").autocomplete({
        minLength: 0,
        source: function (request, response) {
            search(request, response);
        },
        focus: function (event, ui) {
            $("#add-place-input").val(ui.item.name);
            return false;
        },
        select: function (event, ui) {
            $("#add-place-input").val(ui.item.name);
            return false;
        }
    })
        .data("ui-autocomplete")._renderItem = function (ul, item) {

        var result = null;
        var users = "";
        item.userRelation.forEach(function (rel) {
            if (rel.user.id == 3) {
                result = $("<li class='ui-state-disabled'>")
                    .append("<a>" + item.name + "<small class='pull-right'><i>Вы уже хотите посетить это место</i></small></a></li>");
            }
            users += " <span class='label'>" + rel.user.username + "</span>";
        });

        if (result == null) {

            result = $("<li>")
                .append("<a>" + item.name + "<small class='pull-right muted'><i>Хотят посетить: " + users + "</i></small></a></li>");
        }

        result.append("<li class='ui-menu-divider'></li>");
        return result.appendTo(ul);
    };
}


