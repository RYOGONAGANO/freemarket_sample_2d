// $(function(){

//   function method1() {
//     var html = `<div class="exhibit__box__delivery__rightbox__deliverymethod">
//     <div class="exhibit__box__delivery__rightbox__deliverymethod__deliverytitle">
//     <div class="exhibit__box__delivery__rightbox__deliverymethod__deliverytitle__name">
//     配送の方法
//     </div>
//     <div class="exhibit__box__delivery__rightbox__deliverymethod__deliverytitle__required">
//     必須
//     </div>
//     </div>
//     <select name="shipping_method" id="shipping_method">
//     <option value="">---</option>
//     <option value="1">未定</option>
//     <option value="2">らくらくメルカリ便</option>
//     <option value="3">ゆうメール</option>
//     <option value="4">レターパック</option>
//     <option value="5">普通郵便(定形、定形外)</option>
//     <option value="6">クロネコヤマト</option>
//     <option value="7">ゆうパック</option>
//     <option value="8">クリックポスト</option>
//     <option value="9">ゆうパケット</option>
//     </select>
//     <i class="fas fa-angle-down"></i></div>`
//     return html;
//   }
//   function method2() {
//     var html = `<div class="exhibit__box__delivery__rightbox__deliverymethod">
//     <div class="exhibit__box__delivery__rightbox__deliverymethod__deliverytitle">
//     <div class="exhibit__box__delivery__rightbox__deliverymethod__deliverytitle__name">
//     配送の方法
//     </div>
//     <div class="exhibit__box__delivery__rightbox__deliverymethod__deliverytitle__required">
//     必須
//     </div>
//     </div>
//     <select name="shipping_method" id="shipping_method">
//     <option value="">---</option>
//     <option value="1">未定</option>
//     <option value="2">クロネコヤマト</option>
//     <option value="3">ゆうパック</option>
//     <option value="4">ゆうメール</option>
//     </select>
//     <i class="fas fa-angle-down"></i></div>`
//     return html;
//   }


//   $('#charge').on('change', function(){
//       var delivery_charge = document.getElementById("charge").value;
//       switch(delivery_charge){
//         case "送料込み(出品者負担)":
//             $(".exhibit__box__delivery__rightbox__deliverymethod").empty();
//             $('.exhibit__box__delivery__rightbox__deliverymethod').append(method1);
//             $('.exhibit__box__delivery').css({
//             'height': '446px',
//             });
//           break;

//         case "着払い(購入者負担)":
//             $(".exhibit__box__delivery__rightbox__deliverymethod").empty();
//             $('.exhibit__box__delivery__rightbox__deliverymethod').append(method2);
//             $('.exhibit__box__delivery').css({
//             'height': '446px',
//             });
//           break;

//         case "":
//             $(".exhibit__box__delivery__rightbox__deliverymethod").empty();
//             $('.exhibit__box__delivery').css({
//               'height': '',
//               });
//           break;

//         default:
//           break;
//       }
//   });
// });

// 

$(function(){
  function delivery_plus(delivery){
    var html = `<option value="${delivery.name}" data-category="${delivery.id}">${delivery.name}</option>`;
    return html;
  }

  function delivery_method1(insertHTML){
    var html = `<div class="exhibit__box__detail__rightbox__categorybox">
    <div class="exhibit__box__detail__rightbox__categorybox__categorytitle">
    </div>
    <select name="shipping_method" id="shipping_method">
    <option value="">---</option>
    ${insertHTML}
    </select>
    <i class="fas fa-angle-down"></i>
    </div>`;
    $('.exhibit__box__delivery__rightbox__deliverymethod').append(html);
  }

  $('#charge').on('change', function(){
    var method = document.getElementById("charge").value;
    console.log(method)
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
        console.log(shipping);
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




