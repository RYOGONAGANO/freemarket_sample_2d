jQuery(document).ready(function() {
  if(document.URL.match(/\/\products\/\d+$/)) {
    $(".header-breadcrumbs").css("display", "none");
  }
});