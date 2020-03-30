$(window).on('load', ()=> {

  const buildFileField = (num)=> {

    const html = `
                  <input class="image-box__images__input"
                  id="post_images_attributes_${num}_image" type="file"
                  name="post[images_attributes][${num}][image]">
                  `;
    return html;
  }

  const buildImg = (index, url)=> {
    const html2 = `
    <div class= "image-box__images__box">
      <img class= "image-box__images__box__image${index}" img src="${url}" width="100%" height="auto"></img>
      <div class= "image-box__images__box__delete" id="image-box__images__box__delete" width="110px" height="20px">削除</div>
    </div>
      `;
    return html2;
  }
  $(".image-box__images").hide()
  $("#image-box").on("change", function(event) {
    event.preventDefault();
    $(".postRight__form__text").remove()
    const num = $(".image-box__images__box").length;
    const file = event.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    const label_id = $(".label-box").attr('id').replace(/[^0-9]/g, '');


    if (num == 2){
      $('.label-box').attr({id: `label-box--${(Number(label_id))}`,for: `item_images_attributes_${(Number(label_id))}_image`});
      $('.postRight__form').append(buildImg(Number(label_id), blobUrl));
    }else{
      $('.postRight__form').append(buildImg(Number(label_id), blobUrl));
      $('#image-box').prepend(buildFileField(Number(label_id)+1));
      $('.label-box').attr({id: `label-box--${(Number(label_id) + 1)}`,for: `post_images_attributes_${(Number(label_id) + 1)}_image`});
    }
  })

  $(document).on("click", ".image-box__images__box__delete", function(event) {
    event.preventDefault();
    const deleteId = $(this).prev().attr('class').replace(/[^0-9]/g, '');
    const deleteform =  ("#post_images_attributes_"+deleteId+"_image");
    const num = $(".image-box__images__box").length;
    const label_id = $(".label-box").attr('id').replace(/[^0-9]/g, '');

    if (num == 3){
      $('.label-box').attr({id: `label-box--${(Number(label_id) + 1)}`,for: `post_images_attributes_${(Number(label_id)+1)}_image`});
      $('#image-box').prepend(buildFileField(Number(label_id) + 1))
      $(deleteform).remove();
      $(this).closest(".image-box__images__box").remove();
    }else{
      $(deleteform).remove();
      $(this).closest(".image-box__images__box").remove();
    }
  });
})