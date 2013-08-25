class RegionsController < ApplicationController

  def index
    @regions = Region.all.sort

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regions }
    end
  end

  def schedule
    @regions = Region.load_all
    respond_to do |format|
      format.html #{ render template: 'regions/schedule', formats: [:pdf] }
      format.pdf do
        file_name = "maui_bus_schedule_#{Time.now.strftime('%m_%d_%Y_%H%S')}"
        pdf_file = Rails.root.join('private', "#{file_name}.pdf")
        render :pdf => file_name,
               :formats => [:pdf],
               :save_to_file => pdf_file,
               :save_only => true,
               :page_size => "Letter",
               :header => {right: '[page] of [topage]'},
               :footer => {center: 'mauibus.net'}

        send_file(pdf_file, type: 'application/pdf')
      end
    end
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @region = Region.find(params[:name])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @region }
    end
  rescue Region::RecordNotFound
    redirect_to root_path, alert: 'Error! Maybe the region couldnt be found. Please inform @arebuckley'
  end

end