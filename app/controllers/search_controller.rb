require 'trip'

class SearchController < ApplicationController
  layout 'map_hybrid'

  def index
    @page_title = 'Search | Maui Bus Routes'
    search_time = Time.zone.parse(params[:search_time]) rescue Time.zone.now
    trip = Trip.new(params[:origin], params[:destination], search_time)
    @courses = []

    if trip.has_same_points?
      request.flash[:alert] = "You're already there!"
    else
      trip.plan
      trip.courses.sort!
      trip.limit_results!(1)
      @courses = trip.courses
    end

    if request.xhr?
      render json: {
          html: render_to_string(partial: 'direct_routes'),
          points: @courses.any? ? @courses[0].stopping_points : []
      }
    else
      @locations = Location.sorted.map { |key, val| [val.to_s, key] }
    end
  end
end