class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin?

  before_action :get_cookies, :current_user

  private

  def current_user
  	@current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def auth_log_in
  	unless current_user
  		redirect_to log_in_path, error: "请先登陆"
  	end
  end

  def is_admin?
    if current_user
      current_user.is_admin
    else
      false
    end
  end

  def get_cookies
    if cookies[:user_id]
      session[:user_id] = cookies[:user_id]
    end
  end

end
