jQuery(document).ready(function() {
  Dropzone.autoDiscover = false;

  var myDropzone = new Dropzone("#dropzone", {
    url: "/products",
    paramName: "product[images]",
    uploadMultiple: true,
    addRemoveLinks: true,
    dictRemoveFile: "削除",
    acceptedFiles: 'image/*',
    previewTemplate: `
        <div class=\"dz-preview dz-file-preview\">
          <div class=\"dz-image\">
            <img data-dz-thumbnail />
          </div>
          <div class="upload-btn">
            <a href="" class="upload-edit">編集</a>
        </div>`,
    maxFiles: 10,
    maxFilesize: 10,
    dictCancelUpload: "削除",
    autoProcessQueue: false,
    dictDefaultMessage: "ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード",
    dictInvalidFileType: "画像ファイル以外です。",
    dictMaxFilesExceeded: "一度にアップロード出来るのは10ファイルまでです。",
    dictFileTooBig: "ファイルが大きすぎます。 ({{filesize}}MiB). 最大サイズ: {{maxFilesize}}MiB.",
    parallelUploads: 10,
    thumbnailHeight: null,
    thumbnailWidth: null,
    previewsContainer: '.previews',
    queuecomplete: function(){
      // location.href = '/'
    } ,
    init: function() {
      if (!this.element.querySelector(".dz-message")) {
        this.element.appendChild(
          Dropzone.createElement(
            '<div class="dz-default dz-message"><span>' +
              this.options.dictDefaultMessage +
              "</span></div>"
          )
        );
      }

      this.on("maxfilesexceeded", function() {
        this.removeAllFiles(true);
      });

      dzClosure = this;//Makes sure that 'this' is understood inside the functions below.
       //for Dropzone to process the queue (instead of default form behavior):
        document.getElementById("submit-all").addEventListener("click", function(e) {
           //Make sure that the form isn't actually being sent.
            e.preventDefault();
            e.stopPropagation();
            dzClosure.processQueue();
        });
        //send all the form data along with the files:
        this.on("sendingmultiple", function(data, xhr, formData) {
            formData.append("product[name]", jQuery("#product_name").val());
            formData.append("product[description]", jQuery("#product_description").val());
            formData.append("product[category_id]", jQuery("#product_grandchild_category option:selected").data('category'));
            if (jQuery("#product_size").val()) formData.append("product[size]", jQuery("#product_size").val());
            // formData.append("product[brand_name]", jQuery("#product_brand_name").val());
            formData.append("product[status]", jQuery("#product_status").val());
            formData.append("product[fee]", jQuery("#product_fee").val());
            formData.append("product[shipping_method]", jQuery("#product_shipping_method").val());
            formData.append("product[shipping_area]", jQuery("#product_shipping_area").val());
            formData.append("product[shipping_date]", jQuery("#product_shipping_date").val());
            formData.append("product[price]", jQuery("#product_price").val());
        });
        this.on("successmultiple", function(files, response) {
          // Gets triggered when the files have successfully been sent.
          // Redirect user or notify of success.
          location.href = "/"
        });
        this.on("errormultiple", function(files, response) {
          // Gets triggered when there was an error sending the files.
          // Maybe show form again, and notify user of error
          alert("送信できませんでした。")
          location.href = "/products/new"
        });
    },
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });

  const target = document.getElementById("previews");
  const add_target = document.getElementById("dropzone");
  var befor_size = -1;
  var count = 0;
  var observer = new MutationObserver(function() {
    var size = $(".dz-preview").length;
    var preview_size = size;

    if (preview_size > 9) {
      $("#dropzone").css('display', 'none');
    } else if (preview_size > 5) {
      $("#dropzone").css('top', '174px');
      $("#dropzone").css('display', '');
    } else {
      $("#dropzone").css('top', '');
    };

    if (preview_size < befor_size ) {
      add_target.classList.remove(`item${count}`);
      if (size > 4 ) size = size - 5;
      add_target.classList.add(`item${size}`);
    } else if (preview_size > befor_size ) {
      add_target.classList.remove(`item${count}`);
      if (size > 4 ) size = size - 5;
      add_target.classList.add(`item${size}`);
    } else {
      alert("エラーです。");
    }
    count = size;
    befor_size = preview_size;
  });

  const config = {
    attributes: true,
    childList: true,
    characterData: true
  };

  observer.observe(target, config);

  // observer.disconnect();

});
