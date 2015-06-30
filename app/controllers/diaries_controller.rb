class DiariesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,  only: [:new, :create]
  before_action :correct_owner, only: [:edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @diaries = @user.diaries
  end

  def show
    @user  = User.find(params[:user_id])
    @diary = @user.diaries.find(params[:id])
  end

  def new
    @diary = current_user.diaries.build
  end

  def create
    @diary = current_user.diaries.build(diary_params)

    if @diary.save
      redirect_to user_diary_url(user_id: current_user.id, id: @diary.id)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @diary.update_attributes(diary_params)
      redirect_to user_diary_url(user_id: current_user.id, id: @diary.id)
    else
      render "edit"
    end
  end

  def destroy
    @diary.destroy
    flash[:success] = "ちゃんと消したよ"
    redirect_to request.referer || root_url
  end

  private

  def correct_user
    redirect_to root_url unless current_user == User.find(params[:user_id])
  end

  def correct_owner
    @diary = current_user.diaries.find_by(id: params[:id])
    redirect_to root_url if @diary.nil?
  end

  def diary_params
    params.require(:diary).permit(:title, :content)
  end
end
