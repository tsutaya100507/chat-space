class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.order('id ASC')
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group.id)
    else
      redirect_to group_messages_path(@group.id), flash: {alert: 'メッセージを入力してください。'}
    end
  end

 private
  def message_params
    params.require(:message).permit(:message, :image).merge(group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
