class GroupsController < ApplicationController
  before_filter :authenticate, :except => [:show, :index]

  def index
    @groups = Group.find_with_no_parent
  end

  def available
    @groups = Group.available(current_user.id)
  end

  def show
    @group = Group.find(params[:id])
    if (current_user_session)
      @membership = @group.memberships.find_by_user_id(current_user.id)
    end
  end

  def new
    @group = Group.new
    @parent_groups = Group.find_with_no_parent.find_by_admin_rights(current_user.id)
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      membership = Membership.new(user_id: current_user.id, group_id: @group.id)
      membership.role_id = Role.find_by_name("GroupAdmin").id
      if membership.save
        redirect_to group_path(@group), :notice => "Group was created successfully"
      else
        flash[:notice] = "Something went wrong"
      end
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
