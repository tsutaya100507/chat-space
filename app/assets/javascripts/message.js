$(function(){
  function buildHTML(message){
    if(message.image !== ""){
      var imagebuild = `<img src="${ message.image
      }">`
    };
    var html = `<div class="contents__right-content__main-space__chat">
                  <div class="contents__right-content__main-space__chat__upper">
                    <h2 class="contents__right-content__main-space__chat__upper__user-name">
                      ${ message.user_name}
                    </h2>
                    <p class="contents__right-content__main-space__chat__upper__date">
                      ${ message.created_at }
                    </p>
                    <div class="contents__right-content__main-space__chat__lower">
                      <p class="contents__right-content__main-space__chat__lower__massage">
                      ${ message.message}
                      </p>
                      ${ imagebuild }
                    </div>
                  </div>
                </div>`
    return html;
  }

  $('.message_form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.contents__right-content__main-space').append(html)
      $('.contents__right-content__post-space__message').val('')
      $('.contents__right-content__post-space__image').val('')
      $('.contents__right-content__main-space').animate({scrollTop: $('.contents__right-content__main-space')[0].scrollHeight}, 'fast');
    })
    .fail(function(data){
      alert('error');
    })
  });
});


