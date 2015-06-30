class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(nick_name: params[:session][:nick_name])

    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      remember(@user)
      redirect_back_or @user
    else
      flash.now[:alert] = "なんかおかしいね"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
