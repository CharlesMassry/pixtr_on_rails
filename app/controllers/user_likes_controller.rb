class UserLikesController < ApplicationController
  def create
    user = User.find(params[:id])
    Like.create(user: current_user, content: user)
    redirect_to user
  end

  def destroy
    user = User.find(params[:id])
    like = Like.find_by(user: current_user, content: user)
    like.destroy
    redirect_to user
  end
end
