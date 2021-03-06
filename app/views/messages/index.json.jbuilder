  json.array! @new_messages do |message|
    json.user_name    message.user.name
    json.created_at   message.created_at.strftime("%Y-%m-%d %H:%M:%S")
    json.message      message.message
    json.image        message.image.url
    json.id           message.id
  end
