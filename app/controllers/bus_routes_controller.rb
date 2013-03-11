class BusRoutesController < ApplicationController
  def show_times
  end

  def show_map
    @region = Region.find(params[:region_name])
    @bus = @region.find_bus(params[:name])
    render layout: 'map'
  end
end
