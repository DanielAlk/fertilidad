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

Utils.downloadInfo = function() {
	var $modal = $('#downloadInfo');
	var $el = {};
	$el.type = $modal.find('i.icon.mime');
	$el.title = $modal.find('.title');
	$el.description = $modal.find('.description');
	$el.name = $modal.find('.name');
	$el.size = $modal.find('.size');
	$el.date = $modal.find('.date');
	$el.file = $modal.find('.download');
	$('.download-info-trigger').click(function(e) {
		e.preventDefault();
		var href = $(this).attr('href');
		$.getJSON(href, function(download) {
			for (var key in download) {
				switch(key) {
					case 'type': $el.type.attr('class', 'icon mime ' + download.type); break;
					case 'file': $el.file.attr('href', download.file); break;
					case 'name_no_ext': $el.file.attr('download', download.name_no_ext); break;
					default: if ($el[key]) $el[key].text(download[key]);
				};
			};
			$modal.modal('show');
		});
	});
};

Utils.navigation = function() {
	var $body = $('body');
	var $header = $('header');
	var $nav = $('header nav.menu');
	var $menu = $nav.children('div');
	var activate = function() {
		$nav.addClass('active');
		$(document).on('click', hide);
	};
	var deactivate = function() {
		$nav.removeClass('active');
		$(document).off('click', hide);
	};
	var show = function() {
		var height = window.matchMedia('(max-width:767px)').matches ? $body.height() - $header.height() : 'auto';
		$nav.css('height', height).show('slide', {direction: 'left'}, activate);
	};
	var hide = function() {
		$nav.hide('slide', {direction: 'left'}, deactivate);
	};
	$('.menu-trigger a').click(function(e) {
		if (!$nav.is('.active')) show();
	});
};

Utils.startMap = function(elementId) {
	var location = "Diagonal 73 & Calle 46, La Plata, Buenos Aires, Argentina";
	var map_canvas = document.getElementById(elementId);
	var geocoder = new google.maps.Geocoder();
	var map = new google.maps.Map(map_canvas, {
		disableDoubleClickZoom: true,
		scrollwheel: false,
		zoom: 15,
		disableDefaultUI: false,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
	});
	geocoder.geocode({ 'address' : location }, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			var marker = new google.maps.Marker({
				map: map,
				position: results[0].geometry.location,
				animation: google.maps.Animation.DROP,
			});
			map.setCenter(results[0].geometry.location);
		};
	});
	return map;
};

Utils.notice = function() {
	var $modal = $('#modalNotice');
	$modal.modal('show')
	.on('shown.bs.modal', function() {
		$modal.find('.modal-footer>button').focus();
	});
};