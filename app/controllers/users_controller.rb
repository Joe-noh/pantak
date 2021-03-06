class UsersController < ApplicationController
  before_action :logged_in_user, except: [:create]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember(@user)
      redirect_to "/"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新できたね"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :nick_name, :job_type, :self_introduction,
      :icon, :password, :password_confirmation
    )
  end
end
