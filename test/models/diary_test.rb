require 'test_helper'

class DiaryTest < ActiveSupport::TestCase
  def setup
    @diary = diaries(:today)
  end

  test "should be valid" do
    assert @diary.valid?
  end

  test "user_id should be present" do
    @diary.user_id = nil
    assert_not @diary.valid?
  end

  test "title should be present" do
    @diary.title = "  "
    assert_not @diary.valid?
  end

  test "content should be present" do
    @diary.content = "  "
    assert_not @diary.valid?
  end
end
