require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:one)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user_id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "diary_id should be present" do
    @comment.diary_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @comment.content = nil
    assert_not @comment.valid?
  end
end
