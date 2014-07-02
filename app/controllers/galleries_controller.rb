class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      @gallery.save
      redirect_to galleries_path
    else
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      @gallery.update(gallery_params)
      redirect_to gallery_path(gallery.id)
    else
      render :edit
    end
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to "/galleries"
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
end
