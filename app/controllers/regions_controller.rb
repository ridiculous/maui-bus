class RegionsController < ApplicationController

  def index
    @regions = Region.all.sort

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regions }
    end
  end

  def schedule
    @regions = Region.all.sort.map { |region| Region.find(region.downcase) }
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @region = Region.find(params[:name])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @region }
    end
  #rescue
  #  redirect_to root_path, alert: 'Region not found'
  end

end


#time do
#  20.times do |x|
#  @regions = Region.all.sort.map { |region| Region.find(region.downcase) }
#  @regions.each do |region|
#    region.routes.each do |route|
#      if route.next_stops.any?
#        route.next_stops.each do |nxt|
#          puts nxt
#        end
#      end
#    end
#  end
#end
#end
