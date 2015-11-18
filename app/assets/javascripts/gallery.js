$.fn.gallery = function(href) {
	this.each(function() {
		var gallery = this;
		var $gallery = $(gallery);
		var $resize = $gallery.find('.gallery-resize');
		var $transition = $gallery.find('.gallery-resize-transition');
		var $items = $gallery.find('.gallery-item');
		var $controls = $gallery.find('.gallery-controls a');
		var $triggers = $('.gallery-trigger');
		var activate = function() {
			$(this).addClass('active');
		};
		var resize = function($item) {
			$item = $item && $item.length != undefined ? $item : $items.filter('.active');
			var img = $item.find('img').get(0);
			var height = img.naturalHeight;
			var width = img.naturalWidth;
			if (window.matchMedia('(min-width: 992px)').matches) {
				if (width > 800) {
					height = height * 800 / width;
					width = 800;
				};
			} else if (window.matchMedia('(min-width: 768px)').matches) {
				if (width > 600) {
					height = height * 600 / width;
					width = 600;
				};
			} else {
				height = 'auto';
				width = 'auto';
			};
			if (height != 'auto') height = height + 80;
			if ($item.length == undefined) $resize.css({ width: width, height: height });
			else $resize.animate({ width: width, height: height });
		};
		var slide = function(e) {
			var $item = $items.filter('.active');
			if ($(this).is('.gallery-next')) $next = $item.is($items.last()) ? $items.first() : $items.eq($items.index($item)+1);
			else $next = $item.is($items.first()) ? $items.last() : $items.eq($items.index($item)-1);
			$item.hide();
			$items.removeClass('active');
			$next.fadeIn(activate);
			resize($next);
		};
		$controls.click(slide);
		$triggers.click(function(e) {
			e.preventDefault();
			var id = $(this).data('id');
			$items.removeClass('active').hide();
			$items.filter('[data-id='+id+']').addClass('active').show();
			resize();
			$gallery.modal('show');
		});
	});
};