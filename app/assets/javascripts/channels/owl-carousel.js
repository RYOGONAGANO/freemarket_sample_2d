$(function(){
  $(".content__slide-banner.owl-carousel").owlCarousel({
    loop: true,
    nav: true,
    items: 1,
    lazyLoad: true,
    autoplay: true,
    autoplayTimeout: 5000,
    autoplayHoverPause: true,
    smartSpeed: 1000
  });
  $('.content__slide-banner .owl-dot').hover(function() {
    $(this).click();
  }, function() {});

  var owl
  owl = $(".product-photo__carousel.owl-carousel").owlCarousel({
    loop: true,
    lazyLoad: true,
    items: 1,
    smartSpeed: 500,
    dots: true,
    dotsContainer: '.product-photo__dots'
  });
  $(".product-photo__dots").on("click", ".product-photo__dots__dot", function() {
    owl.trigger('to.owl.carousel', [$(this).index(), 500]);
  });
  $('.product-photo__dots__dot').hover(function() {
    $(this).click();
  }, function() {});
});