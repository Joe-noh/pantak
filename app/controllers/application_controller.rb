class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def index
    redirect_to login_user unless logged_in?
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "入社しよっか"
      redirect_to login_url
    end
  end
end
