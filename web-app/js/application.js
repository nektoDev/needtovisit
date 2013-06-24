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
