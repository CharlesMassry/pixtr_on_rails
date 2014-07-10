class LikesController < ApplicationController
  def create
    image = Image.find(params[:id])
    Like.create(user: current_user, image: image)
    redirect_to [image.gallery, image]
  end

  def destroy
    image = Image.find(params[:id])
    like = Like.find_by(user: current_user, image: image)
    like.destroy
    redirect_to [image.gallery, image]
  end
end
