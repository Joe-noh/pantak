require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:joe)
  end

  test "login with invalid information" do
    get login_path
    assert_template "sessions/new"
    post login_path, session: {nick_name: "", password: ""}
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, session: {nick_name: @user.nick_name, password: "password"}
    assert is_logged_in?
    assert_redirected_to @user
  end

  test "logout" do
    log_in_as @user
    assert is_logged_in?
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
  end
end
