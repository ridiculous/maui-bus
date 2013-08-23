class SearchController < ApplicationController
  layout 'map_hybrid'

  def index
    @trip = Trip.new(params[:origin], params[:destination])
    @trip.find_direct_routes #(Time.zone.parse('12:00:00'))
    @trips = @trip.prioritize.sort_by { |t| t.stop_at.time }
    @indirect_routes = @trip.find_indirect_routes if @trips.empty?
    @voyages = @trip.find_voyages if @indirect_routes.try(:empty?)
    @locations = Location.unique.map { |key, val| [val.to_s, key] } unless request.xhr?
    render partial: 'direct_routes' if request.xhr?
  end
end