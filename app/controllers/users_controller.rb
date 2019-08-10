class UsersController < ApplicationController
  before_action: set_user:only:[:edit,:update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to tasks_path
    else
      render 'new_user'
  end

  def edit

  end

  def update
   if  @user.update(user_params)
   redirect_to 

  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:password_digest)
  end

end
