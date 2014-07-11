class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @images = Image.tagged_with(@tag.name)
  end
end
