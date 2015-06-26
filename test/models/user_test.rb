require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    user_params = {
      full_name: "ほんざわ じょう",
      nick_name: "じょう",
      job_type: 300,
      emp_number: 100,
      self_introduction: "こんにちわ",
      password: "password",
      password_confirmation: "password"
    }
    @user = User.new user_params
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

  test "emp_number should be greater than 0" do
    @user.emp_number = 0
    assert_not @user.valid?

    @user.emp_number = 1
    assert @user.valid?
  end

  test "job_type should be one of specified enums" do
    @user.job_type = :general
    assert @user.valid?

    @user.job_type = 100
    assert @user.valid?

    assert_raise {@user.job_type = 101}
    assert_raise {@user.job_type = :unknown}
  end
end
