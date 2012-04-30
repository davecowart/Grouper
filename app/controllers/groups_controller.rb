class GroupsController < ApplicationController
  def index
    if current_user_session
      @groups = current_user.groups
    else
      redirect_to root_path
    end
  end

  def show
    @group = Group.find(params[:id])
    if (current_user_session)
      @membership = @group.memberships.find_by_user_id(current_user.id)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    Membership.transaction do
      if @group.save
        membership = Membership.new({:user => current_user, :group => @group})
        if !membership.save
          flash[:notice] = "Something went wrong"
          render :action => :new
          raise ActiveRecord::Rollback
        end
        flash[:notice] = "Group was created successfully"
        redirect_to group_path(@group)
      else
        render :action => :new
      end
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
