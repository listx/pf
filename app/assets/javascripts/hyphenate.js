jQuery(function ($) {
	$('#typeset .section').each(function () {
		$('p').hyphenate('en-us');
	});
});
