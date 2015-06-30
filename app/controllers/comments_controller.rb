class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js { @comment.save }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :diary_id, :user_id)
  end
end
