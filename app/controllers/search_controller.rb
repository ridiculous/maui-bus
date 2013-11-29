require 'trip'

class SearchController < ApplicationController
  layout 'map_hybrid'

  def index
    @page_title = 'Search | Maui Bus Routes'
    search_time = Time.zone.parse(params[:search_time]) rescue Time.zone.now
    @trip = Trip.new(params[:origin], params[:destination], search_time)

    if @trip.has_same_points?
      request.flash[:alert] = "You're already there!"
    else
      @trip.plan!
    end

    if request.xhr?
      render partial: 'direct_routes'
    else
      @locations = Location.unique.map { |key, val| [val.to_s, key] }
    end
  end
end