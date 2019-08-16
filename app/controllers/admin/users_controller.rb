class Admin::UsersController < ApplicationController
  before_action:access_user, only:[:show]
  before_action:set_user, only:[:edit,:update,:destroy,:show]


  def index
    @users = User.all.includes(:tasks)
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path,notice: "作成しました"
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "削除しました"
  end

  def edit
  end

  def update
     if @user.update(user_params)
       redirect_to admin_users_path,notice: "編集しました"
     end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
  end

end
