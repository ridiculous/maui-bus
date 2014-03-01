class RegionsController < ApplicationController

  def index
    @regions = Region.all.sort
    respond_to do |format|
      format.html
      format.json { render json: @regions }
    end
  end

  def schedule
    @routes = Bus::Data.routes

    respond_to do |format|
      format.html do
        @regions = Region.all.sort
      end
      format.pdf do
        @regions = Region.load_all
        file_name = "maui_bus_schedule_#{Time.now.strftime('%m_%d_%Y')}"
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