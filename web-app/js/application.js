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

    setTimeout(function() {
        hideAlert();
    }, 5000);
}

function hideAlert() {
    var $alert = $('#alert');
    $alert.removeClass('in');
    $alert.addClass('out');
}

