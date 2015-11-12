$.fn.slider = function(delay) {
	this.each(function() {
		var slider = this;
		var $slider = $(slider);
		var $slides = $slider.find('.slide');
		var $indicators = $slider.find('.slider-indicators>a');
		var transition_is_active = false;
		var timer_is_active = false;
		var use_timer = Boolean(delay);
		var timer;

		var pauseWhileTransition = function() { transition_is_active = true; };

		var resumeAfterTransition = function() { transition_is_active = false; };

		var setTimer = function() {
			if (use_timer && !timer_is_active) {
				timer_is_active = true;
				timer = setInterval(interval, delay);
			};
		};

		var unsetTimer = function() {
			if (use_timer && timer_is_active) {
				timer_is_active = false;
				clearInterval(timer);
			};
		};

		var toggle = function(e) {
			$(this).toggleClass('active');
		};

		var toggleEnd = function(e) {
			$(this).toggleClass('active');
			resumeAfterTransition();
			setTimer();
		};

		var showSlide = function(href) {
			var $activeSlide = $slides.filter('.active');
			var $nextSlide = $slides.filter(href);
			var direction = $slides.index($activeSlide) > $slides.index($nextSlide);
			$activeSlide.hide('slide', { direction: ['left', 'right'][Number(direction)] }, toggle);
			$nextSlide.show('slide', { direction: ['left', 'right'][Number(!direction)] }, toggleEnd);
			$indicators.removeClass('active');
			$indicators.filter('[href='+href+']').addClass('active');
		};

		var indicatorClickHandler = function(e) {
			e.preventDefault();
			if (transition_is_active) return;
			if ($(this).is('.active')) return;
			pauseWhileTransition();
			unsetTimer();
			var $this = $(this);
			var href = $this.attr('href');
			showSlide(href);
		};

		var interval = function() {
			if (transition_is_active) return;
			pauseWhileTransition();
			var href;
			var $active = $slides.filter('.active');
			if ($active.is($slides.last())) href = '#' + $slides.first().attr('id');
			else href = '#' + $active.parent().next().children('.slide').attr('id');
			showSlide(href);
		};

		$indicators.click(indicatorClickHandler);
		setTimer();
	});
};