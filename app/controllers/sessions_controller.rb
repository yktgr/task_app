class SessionsController < ApplicationController
  def new
      redirect_to tasks_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tasks_path
      flash[:notice] = "ログインしました"
    else
      flash.now[:danger]
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice]
    redirect_to new_session_path
  end
end
