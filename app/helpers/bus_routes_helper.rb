module BusRoutesHelper

  def locations_as_json
    locations = []
    @bus.stops.each do |my_stop|
      begin
        locations << {
            name: my_stop.name,
            lat: Location[my_stop.location].lat,
            long: Location[my_stop.location].long,
            times: my_stop.times
        }
      rescue
        puts "error finding #{my_stop.location}"
      end
    end
    locations.to_json.html_safe
  end
end
