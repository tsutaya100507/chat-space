class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.ascend
    @group = Group.find(params[:group_id])
    # binding.pry
    respond_to do |format|
      format.html
      format.json { @new_messages = @group.messages.where('id > ?', params[:id]) }
    end
    # @messages = @group.messages.order('id ASC') をscopeを使用したものに書き換え。

  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group) }
        format.json
      end

    else
      redirect_to group_messages_path(@group), flash: {alert: 'メッセージを入力してください。'}
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
