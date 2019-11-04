$(function(){

function category_plus(category){
  var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
  return html;
}

function category_chidren(insertHTML){
  var html = `<div class="exhibit__box__detail__rightbox__categorybox">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle">
  </div>
  <select name="category" id="product_child_category">
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
  <select name="category" id="product_grandchild_category">
  <option value="">---</option>
  ${insertHTML}
  </select>
  <i class="fas fa-angle-down"></i>
  </div>`;
  $('.exhibit__box__detail__rightbox__categorybox#category2').append(html);
}

function category_size(insertHTML){
  var html = `<div class="exhibit__box__detail__rightbox__categorybox">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle__name">
  サイズ
  </div>
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle__required">
  必須
  </div>
  </div>
  <select name="category" id="product_size">
  <option value="">---</option>
  ${insertHTML}
  </select>
  <i class="fas fa-angle-down"></i>
  </div>
  <div class="exhibit__box__detail__rightbox__categorybox">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle__name">
  ブランド
  </div>
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle__any">
  任意
  </div>
  </div>
  <input class="product_name" placeholder="例) シャネル" type="text" name="name" id="product_brand_name">
  </div>`;
  $('.exhibit__box__detail__rightbox__categorybox#category3').append(html);
}

function category_brand(insertHTML){
  var html = `<div class="exhibit__box__detail__rightbox__categorybox">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle">
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle__name">
  ブランド
  </div>
  <div class="exhibit__box__detail__rightbox__categorybox__categorytitle__any">
  任意
  </div>
  </div>
  <input class="product_name" placeholder="例) シャネル" type="text" name="name" id="brand_name">
  </div>`;
  $('.exhibit__box__detail__rightbox__categorybox#category3').append(html);
}

$('#product_category').on('change', function(){
  var category = document.getElementById("product_category").value;
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
    $('.exhibit__box__detail__rightbox__categorybox#category3').empty(); 
    $('.exhibit__box__detail').css({
      'height': '',
      });
      $('.exhibit__box__detail__rightbox__categorybox#category3').css({
        'margin-top': '0px',
      });
  }
});

$('.exhibit__box__detail__rightbox__categorybox#category1').on('change', function(){
  var childId = document.getElementById("product_child_category").value;
  if (childId != ""){ 
    $.ajax({
      url: 'new',
      type: 'GET',
      data: { child_id: childId },
      dataType: 'json'
    })
    .done(function(grandchildren){
        $('.exhibit__box__detail__rightbox__categorybox#category2').empty(); 
        $('.exhibit__box__detail__rightbox__categorybox#category3').empty(); 
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
    $('.exhibit__box__detail__rightbox__categorybox#category3').empty(); 
        $('.exhibit__box__detail').css({
          'height': '317px',
          });
    $('.exhibit__box__detail__rightbox__categorybox#category3').css({
      'margin-top': '0px',
    });
  }
});


$('.exhibit__box__detail__rightbox__categorybox#category2').on('change', function(){
  var size = document.getElementById("product_grandchild_category").value;
  if (size != ""){  
    $.ajax({
      url: 'new',
      type: 'GET',
      data: { size: size },
      dataType: 'json'
    })
    .done(function(size){
      $('.exhibit__box__detail__rightbox__categorybox#category3').empty(); 
      var insertHTML = '';
      size.forEach(function(categorysize){
        insertHTML += category_plus(categorysize);
      });
      
      category_size(insertHTML);
      $('.exhibit__box__detail').css({
        'height': '593px',
        });
      $('.exhibit__box__detail__rightbox__categorybox#category3').css({
        'margin-top': '25px',
      });
    })
    .fail(function(){
      alert('取得に失敗しました');
    })
  }else{
    $('.exhibit__box__detail__rightbox__categorybox#category3').empty(); 
        $('.exhibit__box__detail').css({
          'height': '373px',
          });
          $('.exhibit__box__detail__rightbox__categorybox#category3').css({
            'margin-top': '0px',
          });
  }
});

})

