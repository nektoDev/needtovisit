var previousAlertClass = "class"
function showAlert(clazz) {
    var $alert = $('#alert');
    $alert.removeClass(previousAlertClass);
    previousAlertClass = clazz;

    $alert.addClass(clazz);
    $alert.addClass('in');

    setTimeout(function () {
        hideAlert();
    }, 5000);
}

function hideAlert() {
    var $alert = $('#alert');
    $alert.removeClass('in');
    $alert.addClass('out');
}