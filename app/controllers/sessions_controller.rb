class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to welcome_index_path, notice: "欢迎登陆"
  	else
  		flash.now.alert = "无效的邮箱或者密码"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to log_in_path, notice: "下次再见"
  end
end
