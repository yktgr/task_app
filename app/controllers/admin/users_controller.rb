class Admin::UsersController < ApplicationController
  before_action:require_admin
  before_action:access_user
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
    if current_user != @user
      @user.destroy
      redirect_to admin_users_path, notice: "削除しました"
    else
      redirect_to admin_users_path, notice: "このユーザーは削除できません"
    end
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

  def require_admin
      raise Forbidden unless current_user.admin?
  end


end
