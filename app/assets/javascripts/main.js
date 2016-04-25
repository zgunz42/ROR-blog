/*
	Future Imperfect by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function($) {

	skel.breakpoints({
		xlarge:	'(max-width: 1680px)',
		large:	'(max-width: 1280px)',
		medium:	'(max-width: 980px)',
		small:	'(max-width: 736px)',
		xsmall:	'(max-width: 480px)'
	});

	$(function() {

		var	$window = $(window),
			$body = $('body'),
			$menu = $('#menu'),
			$sidebar = $('#sidebar'),
			$main = $('#main'),
            $wrapper = $('#wrapper'),
            $footer = $('#footer'),
            $fotter_content = $('#main-container-footer'),
			$tab = $(".tab .tabs-nav li");

        // Prevent footer hide main content!
        $wrapper.css('padding-bottom', $footer.height() + $fotter_content.height());

		// Disable animations/transitions until the page has loaded.
			$body.addClass('is-loading');

			$window.on('load', function() {
				window.setTimeout(function() {
					$body.removeClass('is-loading');
				}, 100);
			});

		// Fix: Placeholder polyfill.
			$('form').placeholder();

		// Prioritize "important" elements on medium.
			skel.on('+medium -medium', function() {
                $wrapper.css('padding-bottom', $footer.height() + $fotter_content.height());
                $.prioritize(
					'.important\\28 medium\\29',
					skel.breakpoint('medium').active
				);
			});

		// IE<=9: Reverse order of main and sidebar.
			if (skel.vars.IEVersion <= 9)
				$main.insertAfter($sidebar);

		// Menu.
			$menu
				.appendTo($body)
				.panel({
					delay: 500,
					hideOnClick: true,
					hideOnSwipe: true,
					resetScroll: true,
					resetForms: true,
					side: 'right',
					target: $body,
					visibleClass: 'is-menu-visible'
				});

		// Search (header).
			var $search = $('#search'),
				$search_input = $search.find('input');

			$body
				.on('click', '[href="#search"]', function(event) {

					event.preventDefault();

					// Not visible?
						if (!$search.hasClass('visible')) {

							// Reset form.
								$search[0].reset();

							// Show.
								$search.addClass('visible');

							// Focus input.
								$search_input.focus();

						}

				});
			$tab
				.on('click', function(event){
					// set content tobe first child
					// add hr to this nav element
					event.preventDefault();
					$tab.each(function(index){
						if ($(this).hasClass('active')){
							$(this).removeClass('active');
							$(this).children("hr:first").remove();
							// fixme: hr is added can't be deleted!
						}
					});
					$(this).addClass("active");
					$(this).append("<hr/>");
					// get id of the child
					var tab = $($(this).children("a")).attr("id").split("-")[1];
					$($(".tab .content").children("#content-"+ tab)).prependTo($(".tab .content"));
				});

			$search_input
				.on('keydown', function(event) {

					if (event.keyCode == 27)
						$search_input.blur();

				})
				.on('blur', function() {
					window.setTimeout(function() {
						$search.removeClass('visible');
					}, 100);
				});

		// Intro.
			var $intro = $('#intro');

			// Move to main on <=large, back to sidebar on >large.
				skel
					.on('+large', function() {
						$intro.prependTo($main);
						if ($sidebar.hasClass('right')){
							$sidebar.insertAfter($main);
						}
					})
					.on('-large', function() {
						$intro.prependTo($sidebar);
						if ($sidebar.hasClass('right')){
							$sidebar.insertBefore($main);
						}
					});

	});

})(jQuery);