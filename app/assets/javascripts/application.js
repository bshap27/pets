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
//= require turbolinks
//= require_tree .

// masonry

// var elem = document.querySelector('.grid');
// var msnry = new Masonry( elem, {
//   itemSelector: '.grid-item',
//   columnWidth: 200
// });

// init Masonry
var $grid = $('.grid').masonry({
  itemSelector: '.grid-item',
  columnWidth: 200
});
// layout Masonry after each image loads
$grid.imagesLoaded().progress( function() {
  // setTimeout() {
  	$grid.masonry('layout');
  // }
});