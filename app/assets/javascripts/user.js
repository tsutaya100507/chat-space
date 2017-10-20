$(function(){
  var result = $("#user-search-result")
  var chatmemberlist =$("#chat-member-list")

  function appendUser(user){
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">
                    ${ user.name}
                  </p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${ user.name }">追加
                  </a>
                </div>`
    result.append(html);
  }

  function appendMember(id, name){
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${id}'>
                  <p class='chat-group-user__name'>${name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    chatmemberlist.append(html)
  }

  $('.chat-group-form__search').on("keyup", function(){
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users){
      $('#user-search-result').empty();
    if (users.length !== 0) {
       users.forEach(function(user){
         appendUser(user);
       });
     }
     else {
       appendNoUser("一致する映画はありません");
     }
    })
    .fail(function(){
      alert('ユーザー検索に失敗しました。');
    });
  });

  $(document).on("click", '.chat-group-user__btn--add', function(){
    $(this).parent().remove()
    var id   = $(this).attr('data-user-id');
    var name = $(this).attr('data-user-name');
    appendMember(id, name)
  })

  $(document).on("click", '.js-remove-btn', function(){
    $(this).parent().remove()
  })
});


