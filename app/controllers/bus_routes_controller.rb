class BusRoutesController < ApplicationController
  def show_map
    @region = Region.find(params[:region_name])
    @bus = @region.find_bus(params[:name])
    @page_title = "Map for #{@bus.name} | Maui Bus"
    render layout: 'map'
  end
end
