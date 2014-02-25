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
    @routes = Bus::Data.routes
  end

  def show
    @region = Region.find(params[:name])
    respond_to do |format|
      format.html
      format.json { render json: @region }
    end
  rescue Region::RecordNotFound
    redirect_to root_path, alert: "Couldn't find region '#{params[:name]}'"
  end

end