$(function() {
  $('.product-editBoxs__buttons1__buttonEdit').hover(function() {    
    $(this).css('background', '#ea352d');
  });

  $(".product-editBoxs__buttons3__buttonStop").hover(function(){
    $('.product-editBoxs__buttons1__buttonEdit').css('background', '#aaa');
    }, function() {
      $('.product-editBoxs__buttons1__buttonEdit').css('background', '#ea352d');
  });

  $(".product-editBoxs__buttons4__buttonDelete").hover(function(){
    $('.product-editBoxs__buttons1__buttonEdit').css('background', '#aaa');
    }, function() {
    $('.product-editBoxs__buttons1__buttonEdit').css('background', '#ea352d');
  });
});

