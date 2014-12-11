// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.hypher
//= require en-us
//= require hyphenate
//= require_tree .

$(document).ready(function ($) {
	// Fade-in of everything inside the '.hidden' class.
	$('div.hidden').fadeIn(1000).removeClass('hidden');

	// Login form placeholder text --- remove upon clicking, and restore upon
	// losing focus
	var placeholder_u = $("input#session_name").attr("placeholder");
	var placeholder_p = $("input#session_password").attr("placeholder");
	$("input#session_name, input#session_password").click(function() {
		$(this).attr("placeholder","");
	});
	$("input#session_name, input#session_password").focus(function() {
		$(this).attr("placeholder","");
	});
	$("input#session_name").focusout(function() {
		$(this).attr("placeholder", placeholder_u);
	});
	$("input#session_password").focusout(function() {
		$(this).attr("placeholder", placeholder_p);
	});

	// Make Markdown-rendered subheadings look prettier by prepending them with
	// glyphicons.
	$("#typeset h1").wrap("<div class=\"pf-container-h1\"></div>");
	$("#typeset h2").prepend("<i class=\"fa fa-chevron-circle-right\"></i> ");

	// Carousel: we don't have to hover over the small glyphicon area itself to
	// trigger the animation of that glyhicon being hovered over; instead,
	// hovering over the big 'a' element itself is enough to change the
	// glyphicon colors.
	$("a.carousel-control").on('mouseenter', function() {
		$(this).find('.fa-lg').css('color', 'black');
		$(this).find('i.inverse').css('color', 'white');
	});
	$("a.carousel-control").on('mouseleave', function() {
		$(this).find('.fa-lg').css('color', 'transparent');
		$(this).find('i.inverse').css('color', 'black');
	});
});
