class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    image = Image.new(image_params)
    image.gallery_id = params[:gallery_id]
    image.save
    redirect_to gallery_path(params[:gallery_id])
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
  end

  def update
    image = Image.find(params[:id])
    image.update(image_params)
    redirect_to gallery_image_path(image.gallery_id, image.id)
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to gallery_path(params[:gallery_id])
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :url)
  end
end
