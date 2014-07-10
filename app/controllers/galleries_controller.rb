class GalleriesController < ApplicationController
  before_action :require_login

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def show
    @gallery = find_gallery
    @images = @gallery.images
  end

  def create
    final_params = gallery_params.merge(user_id: current_user.id)
    @gallery = Gallery.new(final_params)
    if @gallery.save
      redirect_to galleries_path
    else
      render :new
    end
  end

  def edit
    @gallery = find_gallery
  end

  def update
    @gallery = find_gallery
    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery.id)
    else
      render :edit
    end
  end

  def destroy
    gallery = find_gallery
    gallery.destroy
    redirect_to "/galleries"
  end

  private

  def find_gallery
    Gallery.find(params[:id])
  end

  def gallery_params # strong_params
    params.require(:gallery).permit(:name, :description)
  end
end
