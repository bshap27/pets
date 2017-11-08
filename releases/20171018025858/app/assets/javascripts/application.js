// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree ../../../vendor/assets/javascripts/.
//= require bootstrap
//= require turbolinks
//= require_tree .

// masonry

$( document ).ready( function(){
	doMasonry(function(){
		masonify();
	});
});

function doMasonry(callback){
	$('.grid').imagesLoaded( function() {
		callback();
	});
}

function masonify(){
	$('.grid').masonry({
	  itemSelector: '.grid-item',
	  columnWidth: 200,
	  gutter: 10
	});
}

function reMasonry(callback){
	$('#pet-render').masonry('destroy');
	callback();
}

$(document).ajaxSuccess(function() { // re-masonry after new pets load
	// if (jQuery('#pet-render').data('masonry')) {
		doMasonry(function(){
			if ($('#pet-render').masonry().length > 0) {
				$('#pet-render').masonry('destroy');
			}
			masonify();
		});
	// }
});

var ias = jQuery.ias({
  container:  '#pet-render',
  item:       '.grid-item',
  pagination: '#pagination',
  next:       '.next',
  // loader: '<img src="css/ajax-loader.gif"/>', // loading gif
	// triggerPageThreshold: 5 ,
});