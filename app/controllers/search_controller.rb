class SearchController < ApplicationController
  layout 'map_hybrid'
  def index
    @trip = Trip.new(params[:origin], params[:destination])
    @trips = @trip.find_direct_routes
    @locations = Location.unique.map { |key, val| [val.to_s, key] }
  end
end