class MembershipsController < ApplicationController
  before_filter :authenticate

  def index
    @memberships = Membership.where(:user_id => current_user.id)
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def new
    @membership = Membership.new
  end

  def create
    membership = Membership.new
    membership.group_id = params[:group_id]
    membership.user_id = current_user.id
    membership.role_id = Role.find_by_name("User").id
    if membership.save
      flash[:notice] = "Successfully joined the group"
      redirect_to group_path(membership.group_id)
    else
      render :action => :new
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to groups_path    
  end
end
