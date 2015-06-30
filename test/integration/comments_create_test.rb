require 'test_helper'

class CommentsCreateTest < ActionDispatch::IntegrationTest
  def setup
    @joe = users(:joe)
    @hon = users(:hon)
    @diary = @joe.diaries.first
  end

  test "create comment" do
    log_in_as @hon
    get user_path(@joe)

    assert_difference "Comment.count", 1 do
      xhr :post, user_diary_comments_path(@joe, @diary),
          comment: {content: "Hey!", diary_id: @diary.id, user_id: @hon.id}
    end
  end
end
