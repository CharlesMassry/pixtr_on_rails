class HatesController < ApplicationController
  before_filter :load_hateable

  def create
    this_route = request.fullpath
    this_route.sub!(/\/comments\/\d|\/hate/, '')
    Hate.create(user: current_user, hateable: @hateable)
    redirect_to this_route
  end

  def destroy
    this_route = request.fullpath
    this_route.sub!(/\/comments\/\d|\/unhate/, '')
    hate = Hate.find_by(user: current_user, hateable: @hateable)
    hate.destroy
    redirect_to this_route
  end

  private

  def load_hateable
    route_to_hate = request.fullpath
    klass = ["comments", "images", "galleries", "groups", "users"].detect do |k|
      route_to_hate.include?(k)
    end
    @hateable = klass.singularize.classify.constantize.find(params[:id])
  end
end
