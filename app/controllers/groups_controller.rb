class GroupsController < ApplicationController
  before_action :set_groups, only: [:edit,:update]

  def index
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, flash: {notice: 'グループを作成しました。'}
    else
      flash.now[:alert] = 'グループの作成に失敗しました'
      render "new"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), flash: {notice: 'グループを編集しました。'}
    else
      render "edit"
    end
  end

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def set_groups
    @group = Group.find(params[:id])
  end

end
