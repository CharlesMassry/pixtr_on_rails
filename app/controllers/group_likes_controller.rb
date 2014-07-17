class GroupLikesController < ApplicationController
  def create
    group = Group.find(params[:id])
    Like.create!(user: current_user, content: group)
    redirect_to group
  end

  def destroy
    group = Group.find(params[:id])
    like = Like.find_by(user: current_user, content: group)
    like.destroy
    redirect_to group
  end
end
