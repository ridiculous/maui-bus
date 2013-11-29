class BusRoutesController < ApplicationController

  # show_bus_map GET /regions/:region_name/routes/:name/map
  def show_map
    @region = Region.find(params[:region_name])
    @bus = @region.find_bus(params[:name])
    @page_title = "Map for #{@bus.name} | Maui Bus Routes"
    render layout: 'map'
  end

  # bus_route_schedule GET /regions/:region_name/routes/:name/schedule
  def schedule
    render text: view_context.schedule_for(Region.find(params[:region_name]).find_bus(params[:name]))
  end
end
