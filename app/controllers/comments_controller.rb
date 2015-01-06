class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def create
    @post = Post.find_by_id params[:post_id]
    @comment = @post.comments.create(params.require(:comment).permit(:nickname, :content).clean_strict(:nickname, :content)) do |c|
      c.is_admin = user_signed_in?
    end
    session[:nickname] = @comment.nickname
    redirect_to :back
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end

end
