class RegionsController < ApplicationController

  def index
    @regions = Region.all.sort
    respond_to do |format|
      format.html
      format.json { render json: @regions }
    end
  end

  def schedule
    @regions = Region.all.sort
    @routes = BusData.routes
  end

  def show
    @region = Region.find(params[:name])
    respond_to do |format|
      format.html
      format.json { render json: @region }
    end
  rescue Region::RecordNotFound
    redirect_to root_path, alert: 'Error! Maybe the region couldnt be found. Please inform @arebuckley'
  end

end