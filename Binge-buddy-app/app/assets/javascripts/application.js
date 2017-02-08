// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function(){
  console.log("DOC LOAD");
  var height = $(window).height();
  $('#header').css('height', height + 'px');
  $(".mock-div").css('height', height);
  $(".mock-div2").css('height', height);
  $(".mock-div3").css('height', height);
  $(".mock-div5").css('height', height);
  $(".flex-container").css('height', height);
});

$(document).ready(function() {
  console.log("DOC READY");
  $(window).on("resize", function () {
     var height = $(window).height();
     $('#header').css('height', height + 'px');
     $(".mock-div").css('height', height);
     $(".mock-div2").css('height', height);
     $(".mock-div3").css('height', height);
     $(".mock-div5").css('height', height);
     $(".flex-container").css('height', height);
   }).resize();


  // fade to reveal, then hide so that <a> links are clickable
  $(".mock-div5").delay(700).animate({"opacity": "0"}, 4000, function() {
    $(".mock-div5").hide();
  }); // end mock div reveal


  (function($) {
  // cite this
      $.fn.honeycombs = function(options) {

          // Establish our default settings
          var settings = $.extend({
              combWidth: 250,
              margin: 10
          }, options);

          function initialise(element) {

              $(element).addClass('honeycombs-wrapper');

              var width = 0;
              var combWidth = 0;
              var combHeight = 0;
              var num = 0;
              var $wrapper = null;

              /**
               * Build the dom
               */
              function buildHtml(){
                  // add the 2 other boxes
                  $(element).find('.comb').wrapAll('<div class="honeycombs-inner-wrapper"></div>');
                  $wrapper = $(element).find('.honeycombs-inner-wrapper');

                  $(element).find('.comb').append('<div class="hex_l"></div>');
                  $(element).find('.hex_l').append('<div class="hex_r"></div>');
                  $(element).find('.hex_r').append('<div class="hex_inner"></div>');

                  $(element).find('.hex_inner').append('<div class="inner_span"><div class="inner-text"></div></div>');

                  num = 0;

                  $(element).find('.comb').each(function(){
                      num = num + 1;
                      var image = $(this).find('img').attr('src');
                      var css = 'url("'+image+'") ';

                      $(this).find('.hex_inner').attr('style', 'background-image: '+css);

                      if($(this).find('span').length > 0){
                          $(this).find('.inner_span .inner-text').html($(this).find('span').html());
                      }else{
                          $(this).find('.inner_span').remove();
                      };
                  });

                  $(element).find('img, span, .inner_span').hide();
              }

              /**
               * Update all scale values
               */
              function updateScales(){
                  combWidth = settings.combWidth;
                  combHeight = ( Math.sqrt(3) * combWidth ) / 2;
                  edgeWidth = combWidth / 2;


                  $(element).find('.comb').width(combWidth).height(combHeight);
                  $(element).find('.hex_l, .hex_r').width(combWidth).height(combHeight);
                  $(element).find('.hex_inner').width(combWidth).height(combHeight);
              }

              /**
               * update css classes
               */
              function reorder(animate){

                  updateScales();
                  width = $(element).width();

                  newWidth = ( num / 1.5) * settings.combWidth;

                  if(newWidth < width){
                      width = newWidth;
                  }

                  $wrapper.width(width);

                  var row = 0; // current row
                  var upDown = 1; // 1 is down
                  var left = 0; // pos left
                  var top = 0; // pos top

                  var cols = 0;

                  $(element).find('.comb').each(function(index){

                      top = ( row * (combHeight + settings.margin) ) + (upDown * (combHeight / 2 + (settings.margin / 2)));

                      if(animate == true){
                          $(this).stop(true, false);
                          $(this).animate({'left': left, 'top': top});
                      }else{
                          $(this).css('left', left).css('top', top);
                      }

                      left = left + ( combWidth - combWidth / 4 + settings.margin );
                      upDown = (upDown + 1) % 2;

                      if(row == 0){
                          cols = cols + 1;
                      }

                      if(left + combWidth > width){
                          left = 0;
                          row = row + 1;
                          upDown = 1;
                      }
                  });

                  $wrapper
                      .width(cols * (combWidth / 4 * 3 + settings.margin) + combWidth / 4)
                      .height((row + 1) * (combHeight + settings.margin) + combHeight / 2);
              }

              $(window).resize(function(){
                  reorder(true);
              });

              $(element).find('.comb').mouseenter(function(){
                  $(this).find('.inner_span').stop(true, true);
                  $(this).find('.inner_span').fadeIn();
              });

              $(element).find('.comb').mouseleave(function(){
                  $(this).find('.inner_span').stop(true, true);
                  $(this).find('.inner_span').fadeOut();
              });

              buildHtml();
              reorder(false);
          }

          return this.each(function() {
              initialise(this);
          });

      }

  }(jQuery));


 // fade to reveal, then hide so that <a> links are clickable
 // $("#mock-div").delay(300).animate({"opacity": "0"}, 1000, function() {
 //   $("#mock-div").hide();
 // });



 }); // end of unload
