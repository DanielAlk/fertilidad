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