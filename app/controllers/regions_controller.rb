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
  #  redirect_to root_path, alert: 'Error! Maybe the region couldnt be found. Please inform @arebuckley'
  end

end