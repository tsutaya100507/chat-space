class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
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
    params.require(:group).permit(:name,group_ids:[])
  end

end
