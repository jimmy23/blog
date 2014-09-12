class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :auth_log_in

  helper_method :current_user

  private

  def current_user
  	@current_user ||= session[:user_id] && User.find(session[:user_id])
  end

  def auth_log_in
  	if !current_user
  		redirect_to welcome_index_path, notice: "欢迎回来"
  	else
  		redirect_to log_in_path, error: "请先登陆"
  	end
  end


end
