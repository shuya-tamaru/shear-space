
$(window).on('turbolinks:load', ()=> {

  const buildImg = (url)=> { 

    const html = `
                  <div class= "profile__image__box">
                    <img class= "profile__image__box" img src="${url}" width="auto" height="100%"></img>
                    <div class= "profile__image__box__delete" id="profile__image__box__delete" width="110px" height="20px">削除</div>
                  </div>
                  `;
    return html;
  }

  // $("#image-box").on("change", function(event) {
  //   event.preventDefault();
  //   $(".postRight__form__text").remove()
  //   const num = $(".image-box__images__box").length;
  //   const file = event.target.files[0];
  //   const blobUrl = window.URL.createObjectURL(file);
  //   const label_id = $(".label-box").attr('id').replace(/[^0-9]/g, '');

  //   if (num == 2){
  //     $('.label-box').attr({id: `label-box--${(Number(label_id))}`,for: `item_images_attributes_${(Number(label_id))}_image`});
  //     $('.postRight__form').append(buildImg(Number(label_id), blobUrl));
  //   }else{
  //     $('.postRight__form').append(buildImg(Number(label_id), blobUrl));
  //     $('#image-box').prepend(buildFileField(Number(label_id)+1));
  //     $('.label-box').attr({id: `label-box--${(Number(label_id) + 1)}`,for: `post_images_attributes_${(Number(label_id) + 1)}_image`});
  //   }
  // })

  $('#SignUpMain__image').on("change",function(event){
    event.preventDefault();
    const file = event.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    $(".SignUpRight__form__text").hide()
    $(".SignUpMain__label").append(buildImg(blobUrl))
  })

  $(document).on("click",".profile__image__box__delete",function(){
    $(this).closest(".profile__image__box").remove();
    $("#SignUpMain__image").val("");
    $(".SignUpRight__form__text").show()
  })
})