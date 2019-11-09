$(function(){
  function delivery_plus(delivery){
    var html = `<option value="${delivery.name}" data-category="${delivery.id}">${delivery.name}</option>`;
    return html;
  }

  function delivery_method1(insertHTML){
    var html = `<div class="exhibit__box__detail__rightbox__categorybox">
    <div class="exhibit__box__detail__rightbox__categorybox__categorytitle">
    </div>
    <select name="product[shipping_method]" id="product_shipping_method">
    <option value="">---</option>
    ${insertHTML}
    </select>
    <i class="fas fa-angle-down"></i>
    </div>`;
    $('.exhibit__box__delivery__rightbox__deliverymethod').append(html);
  }

  $('#product_fee').on('change', function(){
    var method = document.getElementById("product_fee").value;
    if (method != ""){
      $.ajax({
        url: 'new',
        type: 'GET',
        data: { method: method },
        dataType: 'json'
      })
      .done(function(shipping){
        $('.exhibit__box__delivery__rightbox__deliverymethod').empty(); 
        var insertHTML = '';
        shipping.forEach(function(delivery){
          insertHTML += delivery_plus(delivery);
        });
        delivery_method1(insertHTML);
        $('.exhibit__box__delivery').css({
          'height': '446px',
          });
      })
      .fail(function(){
        alert('取得に失敗しました');
      })
    }else{
      $('.exhibit__box__delivery__rightbox__deliverymethod').empty();
      $('.exhibit__box__delivery').css({
        'height': '',
        });
    }
  });
  $(document).on('keyup', function(){
      $('.product_price').on('keyup',function(){
        var price = $('.product_price').val();
        if (price >=300 && price <= 9999999){
          var fee = Math.floor(price * 0.1)
          var fee_sum = price - fee
          $('#fee').text(fee);
          $('#fee_sum').text(fee_sum);
        }
        else{
          $('#fee').empty()
          $('#fee_sum').empty()
          $('#fee').append('-');
          $('#fee_sum').append('-');
        }
      })
    });
})




