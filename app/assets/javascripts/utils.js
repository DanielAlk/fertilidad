var Utils = {};

Utils.scroller = function() {
	$('[data-scroll]').click(function(e) {
		e.preventDefault();
		var $this = $(this);
		var $target = $($this.data('scroll'));
		if (!$target.length) return;
		var top = $target.offset().top;
		var $body = $('html,body');
		$body.stop(true,true);
		$body.animate({ scrollTop: top });
	});
};

Utils.adminButtons = function() {
	$admin_buttons = $('.admin-buttons').css('display', $.cookie('admin_buttons_display'));
	$('.admin-info').css('cursor', 'pointer').click(function(e) {
		$admin_buttons.toggle(400, function() {
			$.cookie('admin_buttons_display', $admin_buttons.css('display'), { path: '/' });
		});
	});
};