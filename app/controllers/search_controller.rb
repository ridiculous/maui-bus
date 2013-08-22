class SearchController < ApplicationController
  layout 'map_hybrid'

  def index
    @trip = Trip.new(params[:origin], params[:destination])
    @trip.find_direct_routes#(Time.zone.parse('Mon, 19 Aug 2013 12:27:40'))
    @trips = @trip.prioritize.sort_by { |t| t.stop_at.time }
    @locations = Location.unique.map { |key, val| [val.to_s, key] } unless params[:async]
    render partial: 'direct_routes' if params[:async]
  end
end