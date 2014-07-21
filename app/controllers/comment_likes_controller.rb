class CommentLikesController < ApplicationController
  def create
    comment = Comment.find(params[:id])
    Like.create!(user: current_user, content: comment)
    redirect_to [comment.image.gallery, comment.image]
  end

  def destroy
    comment = Comment.find(params[:id])
    like = Like.find_by(user: current_user, content: comment)
    like.destroy
    redirect_to [comment.image.gallery, comment.image]
  end
end
