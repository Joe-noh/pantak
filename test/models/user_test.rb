require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:joe)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "full_name shoud be present" do
    @user.full_name = "  "
    assert_not @user.valid?
  end

  test "nick_name shoud be present" do
    @user.nick_name = "  "
    assert_not @user.valid?
  end

  test "job_type shoud be present" do
    @user.job_type = nil
    assert_not @user.valid?
  end

  test "emp_number shoud be present" do
    @user.emp_number = "  "
    assert_not @user.valid?
  end

  test "emp_nunmber should be greater than 0" do
    @user.emp_number = 0
    assert_not @user.valid?

    @user.emp_number = 1
    assert @user.valid?
  end
end
