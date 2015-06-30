require 'test_helper'

class DiaryManipulationTest < ActionDispatch::IntegrationTest
  def setup
    @user  = users(:joe)
    @diary = @user.diaries.first
    @diary_params = {title: "日報", content: "いぇい！"}

    log_in_as @user
  end

  test "list diaries" do
    get user_diaries_path(@user, @diary)
    assert_equal assigns(:diaries), @user.diaries
  end

  test "show a diary" do
    get user_diary_path(@user, @diary)
    assert_equal assigns(:diary), @diary
  end

  test "create new diary" do
    get new_user_diary_path(@user)

    assert_difference "Diary.count", 1 do
      post user_diaries_path(@user), diary: @diary_params
    end
  end

  test "update a diary" do
    get edit_user_diary_path(@user, @diary)
    patch user_diary_path(@user, @diary), diary: @diary_params

    @diary.reload

    assert_equal @diary_params[:title],   @diary.title
    assert_equal @diary_params[:content], @diary.content
  end

  test "delete a diary" do
    get user_diaries_path(@user, @diary)

    assert_difference "Diary.count", -1 do
      delete user_diary_path(@user, @diary)
    end
  end
end
