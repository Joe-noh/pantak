require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "top page where user is not logged in" do
    get root_path

    assert_template "sessions/new"
    assert_select "a[href=?]", root_path, count: 1
  end
end
