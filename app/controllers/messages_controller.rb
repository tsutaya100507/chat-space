class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages =@group.messages.order('id DESC')
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to "index"
    end
  end

 private
  def message_params
    params.require(:message).permit(:message, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
