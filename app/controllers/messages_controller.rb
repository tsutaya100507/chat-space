class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.order('id DESC')
  end

  def create
    @message = current_user.messages.new(message_params)
    # @message = @group.messages
    if @message.save
      redirect_to group_messages_path(@group.id)
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to "index"
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
