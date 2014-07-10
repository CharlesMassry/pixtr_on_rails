class HatesController < ApplicationController
  def create
    image = Image.find(params[:id])
    Hate.create(user: current_user, image: image)
    redirect_to [image.gallery, image]
  end

  def destroy
    image = Image.find(params[:id])
    hate = Hate.find_by(user: current_user, image: image)
    hate.destroy
    redirect_to [image.gallery, image]
  end
end
