$(document).ready(function(){
  $('.main-tabs li').mouseenter(function(){
    $('.main-tabs li').removeClass('current-tab');
    $(this).addClass('current-tab');
  });
  $('.main-tabs li').mouseleave(function(){
    $('.main-tabs li').removeClass('current-tab');
    $(this).removeClass('current-tab');
  });
})
