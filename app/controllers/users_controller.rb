class UsersController < ApplicationController
  before_action:access_user, only:[:show]
  before_action:set_user, only:[:show]

  def new
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] =  @user.id
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def show
    redirect_to tasks_path unless current_user == @user || current_user.admin == true
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
