class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def access_user
      redirect_to new_session_path,flash[:notice] = "ログインが必要です" unless session[:user_id] != nil
  end

class Forbidden < ActionController::ActionControllerError
end

  rescue_from Forbidden, with: :rescue403

  private

  def rescue403(e)
    @exception = e
      render 'admin/forbbiden' , status:403
  end
end
