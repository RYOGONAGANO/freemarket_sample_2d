$(function(){
  var link = $(".mypage-menu-list__line");
  var currentUrl = location.pathname;
  link.each(function() {
    if ($(this).attr("href") == currentUrl) {
      $(this).addClass("active");
    }
  })
});