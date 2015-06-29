require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:joe)
    log_in_as @user
  end

  test "edit with invalid params" do
    get edit_user_path(@user)
    assert_template "users/edit"

    params = {nick_name: ""}
    patch user_path(@user), user: params
    assert_template "users/edit"
  end

  test "edit with valid params" do
    get edit_user_path(@user)

    params = {
      nick_name: "ざわさん", job_type: "general",
      self_introduction: "ちーっす"
    }
    patch user_path(@user), user: params
    follow_redirect!
    assert_template "users/show"

    @user.reload

    assert_equal params[:nick_name], @user.nick_name
    assert_equal params[:job_type],  @user.job_type
    assert_equal params[:self_introduction], @user.self_introduction
  end

  test "full_name and id cannot be changes via web" do
    org_name = @user.full_name
    org_id   = @user.id

    get edit_user_path(@user)

    params = {full_name: "ほんざわ うえ", id: 20}
    patch user_path(@user), user: params
    follow_redirect!
    assert_template "users/show"

    @user.reload

    assert_equal org_name, @user.full_name
    assert_equal org_id,   @user.id
  end
end
