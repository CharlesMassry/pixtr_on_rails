class GalleryLikesController < ApplicationController
  def create
    gallery = Gallery.find(params[:id])
    Like.create(user: current_user, content: gallery)
    redirect_to gallery
  end

  def destroy
    gallery = Gallery.find(params[:id])
    like = Like.find_by(user: current_user, content: gallery)
    like.destroy
    redirect_to gallery
  end
end
