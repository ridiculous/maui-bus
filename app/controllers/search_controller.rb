class SearchController < ApplicationController
  #layout 'map'
  def index
    @trip = Trip.new(params[:origin], params[:destination])
    @trips = @trip.find_direct_routes
  end
end