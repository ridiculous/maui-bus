require 'trip'

class SearchController < ApplicationController
  layout 'map_hybrid'

  def index
    search_time = Time.zone.parse(params[:search_time]) rescue Time.zone.now
    @trip = Trip.new(params[:origin], params[:destination], search_time || Time.zone.now)
    if @trip.has_same_points?
      request.flash[:alert] = "You're already there!"
    else
      @trip.plan!
    end
    @locations = Location.unique.map { |key, val| [val.to_s, key] } unless request.xhr?
    render partial: 'direct_routes' if request.xhr?
  end
end