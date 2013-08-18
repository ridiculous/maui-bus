class SearchController < ApplicationController
  layout 'map_hybrid'

  def index
    @trip = Trip.new(params[:origin], params[:destination])
    @trip.find_direct_routes
    @trips = @trip.prioritize.sort_by { |t| t.stop_at.time }
    @locations = Location.unique.map { |key, val| [val.to_s, key] }
  end
end