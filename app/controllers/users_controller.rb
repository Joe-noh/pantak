class UsersController < ApplicationController
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
      redirect_to "/"
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :full_name, :nick_name, :job_type, :self_introduction,
      :password, :password_confirmation
    )
  end
end
