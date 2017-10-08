class GroupsController < ApplicationController

  def index
    @group = Group.find(params[:id])
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
      # binding.pry
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def group_params
    params.require(:group).permit(:name,user_ids:[])
  end

end
