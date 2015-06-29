require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "top page where user is not logged in" do
    get root_path

    assert_template "sessions/new"
    assert_select "a[href=?]", root_path, count: 1
  end

  test "top page where user is logged in" do
    @user = users(:joe)
    log_in_as @user

    get root_path

    assert_select "a[href=?]", root_path,        count: 1
    assert_select "a[href=?]", user_path(@user), count: 1
    assert_select "a[href=?]", logout_path,      count: 1
  end
end
