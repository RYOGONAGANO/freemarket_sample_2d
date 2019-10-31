jQuery(document).ready(function() {
  //   $("#drop").dropzone({
  //   url: "/products",
  //   paramName: "product[images][]",
  //   uploadMultiple: true,
  //   addRemoveLinks: true,
  //   dictRemoveFile: "削除",
  //   previewTemplate: `
  //       <div class=\"dz-preview dz-file-preview\">
  //         <div class=\"dz-image\">
  //           <img data-dz-thumbnail />
  //         </div>
  //         <div class="upload-btn">
  //           <a href="" class="upload-edit">編集</a>
  //       </div>`,
  //   maxFiles: 10,
  //   maxFilesize: 10,
  //   autoProcessQueue: false,
  //   dictDefaultMessage: "ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード"
  // });
  var myDropzone = new Dropzone("#dropzone", {
    url: "/products/image",
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
    previewsContainer: ".previews",
    init: function() {
      if ( !this.element.querySelector(".dz-message") ) {
        this.element.appendChild(Dropzone.createElement("<div class=\"dz-default dz-message\"><span>" + this.options.dictDefaultMessage + "</span></div>"));
      }
    }
  });

  $(".form-product").on("submit", function(e) {
    myDropzone.processQueue();
  });

  const target = document.getElementById('previews');
  const add_target = document.getElementById('dropzone');
  var count = 1;
  var befor_size = -1;
  var observer = new MutationObserver(function(){
    var size = $(".dz-preview").length;
    console.log(size);
    console.log(befor_size);
    if( size < befor_size ) {
      count--;
      add_target.classList.remove(`item${count}`);
      befor_size = size;
    } else if( size > befor_size){
      add_target.classList.remove(`item${count}`);
      add_target.classList.add(`item${count}`);
      count++;
      befor_size = size;
    } else {
      alert('エラーです。');
    };
    console.log(count);
  });


  const config = {
    attributes: true,
    childList: true,
    characterData: true
  };

  console.log(add_target);
  observer.observe(target, config);

  // observer.disconnect();



  // $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
  //   var token = $('meta[name="csrf-token"]').attr('content');
  //   return jqXHR.setRequestHeader('X-CSRF-Token', token);
  // });
});