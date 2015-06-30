class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :diary_id, :user_id)
  end
end
