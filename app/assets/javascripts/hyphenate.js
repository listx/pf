jQuery(function ($) {
	$('div.hidden').fadeIn(1000).removeClass('hidden');
	$('#typeset .section').each(function () {
		$('p').hyphenate('en-us');
	});
});
