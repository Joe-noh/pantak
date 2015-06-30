require 'test_helper'

class DiaryAccessRestrictionTest < ActionDispatch::IntegrationTest
  def setup
    @user  = users(:joe)
    @diary = @user.diaries.first
  end

  test "cannot access when not logged-in" do
    get user_diaries_path(@user)
    assert_response :redirect

    get new_user_diary_path(@user)
    assert_response :redirect

    get edit_user_diary_path(@user, @diary)
    assert_response :redirect

    get user_diary_path(@user, @diary)
    assert_response :redirect

    post user_diaries_path, diary: {}
    assert_response :redirect

    patch user_diary_path(@user, @diary), diary: {}
    assert_response :redirect

    delete user_diary_path(@user, @diary), diary: {}
    assert_response :redirect
  end
end
