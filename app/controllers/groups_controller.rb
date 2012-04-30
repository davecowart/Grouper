class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    @group.update_slug
    if @group.save
      flash[:notice] = "Group was created successfully"
      redirect_to group_path(@group)
    else
      render :action => :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update_slug
    if @group.update_attributes(params[:group])
      flash[:notice] = "Group was updated successfully"
      redirect_to group_path(@group)
    else
      render :action => :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end
end
