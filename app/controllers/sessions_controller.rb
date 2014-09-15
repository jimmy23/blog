class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id
      cookies[:user_id] = {:value => user.id, :expires => Time.now + 1.day} if params[:remember]
  		redirect_to articles_path, notice: "欢迎回来"
  	else
  		flash.now.alert = "无效的邮箱或者密码"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
    cookies.delete(:user_id)
    flash[:notice] = "下次再见"
  	redirect_to root_path
  end
end
