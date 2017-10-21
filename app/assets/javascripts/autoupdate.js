$(document).on('turbolinks:load', function() {

  function buildHTML(message) {
    if(message.image !== ""){
      var imagebuild = `<img src="${ message.image }">`
    };

    var html = `<div class="contents__right-content__main-space__chat" data-id="${message.id}">
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

    var interval = setInterval(function(){
      if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    var message_id = $(".contents__right-content__main-space__chat:last-child").data('id')
    $.ajax({
      type: 'GET',
      url: location.href,
      data: {id: message_id },
      dataType: 'json'
    })
    .done(function(messages) {
      if(messages !== ""){
        var insertHTML = "";
        messages.forEach(function(message) {
        insertHTML = buildHTML(message);
        });
      $('.contents__right-content__main-space').append(insertHTML);
      $('.contents__right-content__main-space').animate({scrollTop: $('.contents__right-content__main-space')[0].scrollHeight}, 'fast');
      }
    })
    .fail(function(message){
      alert('自動更新に失敗しました');
    });
    } else {
    clearInterval(interval);
    }}, 5000 );
});


