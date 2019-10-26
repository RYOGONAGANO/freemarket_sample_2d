$(function(){

function category_plus(category){
  var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
  return html;
}

function category_chidren(insertHTML){
  var html = `<div class="exhibit__box__detail__rightbox__categorybox">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle">
  </div>
  <select name="category" id="child_category">
  <option value="">---</option>
  ${insertHTML}
  </select>
  <i class="fas fa-angle-down"></i>
  </div>`;
  $('.exhibit__box__detail__rightbox__categorybox#category1').append(html);
}

function category_grandchildren(insertHTML){
  var html = `<div class="exhibit__box__detail__rightbox__categorybox">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle">
  </div>
  <select name="category" id="grandchild_category">
  <option value="">---</option>
  ${insertHTML}
  </select>
  <i class="fas fa-angle-down"></i>
  </div>`;
  $('.exhibit__box__detail__rightbox__categorybox#category2').append(html);
}

$('#category').on('change', function(){
  var category = document.getElementById("category").value;
  if (category != ""){ 
    $.ajax({
      url: 'new',
      type: 'GET',
      data: { parent_name: category },
      dataType: 'json'
    })
    .done(function(children){
      $('.exhibit__box__detail__rightbox__categorybox#category1').empty(); 
      var insertHTML = '';
      children.forEach(function(child){
        insertHTML += category_plus(child);
      });
      category_chidren(insertHTML);
      $('.exhibit__box__detail').css({
        'height': '317px',
        });
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  }else{
    $('.exhibit__box__detail__rightbox__categorybox#category1').empty();
    $('.exhibit__box__detail__rightbox__categorybox#category2').empty();  
    $('.exhibit__box__detail').css({
      'height': '',
      });
  }
});

$('.exhibit__box__detail__rightbox__categorybox#category1').on('change', function(){
  var childId = document.getElementById("child_category").value;
  if (childId != ""){ 
    $.ajax({
      url: 'new',
      type: 'GET',
      data: { child_id: childId },
      dataType: 'json'
    })
    .done(function(grandchildren){
        $('.exhibit__box__detail__rightbox__categorybox#category2').empty(); 
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += category_plus(grandchild);
        });
        category_grandchildren(insertHTML);
        $('.exhibit__box__detail').css({
          'height': '373px',
          });
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  }else{
    $('.exhibit__box__detail__rightbox__categorybox#category2').empty(); 
        $('.exhibit__box__detail').css({
          'height': '317px',
          });
  }
});


})

