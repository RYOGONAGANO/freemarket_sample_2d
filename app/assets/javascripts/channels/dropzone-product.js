jQuery(document).ready(function() {
  var myDropzone = new Dropzone("#dropzone", {
    url: "/products",
    paramName: "product[images]",
    uploadMultiple: true,
    addRemoveLinks: true,
    dictRemoveFile: "削除",
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
    parallelUploads: 10,
    thumbnailHeight: null,
    thumbnailWidth: null,
    previewsContainer: '.previews',
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
    },
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });

  $(".form-product").on("submit", function(e) {
    myDropzone.processQueue();
  });

  const target = document.getElementById("previews");
  const add_target = document.getElementById("dropzone");
  var count = 1;
  var befor_size = -1;
  var observer = new MutationObserver(function() {
    var size = $(".dz-preview").length;

    if (size > 9) {
      $("#dropzone").css('display', 'none');
    } else if (size > 5) {
      $("#dropzone").css('top', '174px');
      $("#dropzone").css('display', '');
    } else {
      $("#dropzone").css('top', '');
    };


    if (size < befor_size ) {
      count--;
      add_target.classList.remove(`item${count}`);
      if (count < 1 ) count = 5;
      add_target.classList.add(`item${count - 1}`);
      befor_size = size;
    } else if (size > befor_size ) {
      add_target.classList.remove(`item${count - 1}`);
      if (count > 4) count = 0;
      add_target.classList.add(`item${count}`);
      count++;
      befor_size = size;
    } else {
      alert("エラーです。");
    }
  });

  const config = {
    attributes: true,
    childList: true,
    characterData: true
  };

  observer.observe(target, config);

  // observer.disconnect();

});
