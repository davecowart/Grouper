class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user, :is_group_admin

private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def is_group_admin(group_id)
    return false if current_user.nil?
    Role.find_by_membership(group_id, current_user.id).rank >= 10
  end

protected
  def authenticate
    return redirect_to root_path if current_user.nil?
  end
end
