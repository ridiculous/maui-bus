module BusRoutesHelper

  def locations_as_json
    locations = []
    origin = @bus.stops[0].name
    destination = @bus.stops.detect { |s| s.destination }.name
    @bus.stops.each do |my_stop|
      begin
        my_location = locations.find { |loc| loc[:name] == my_stop.name }
        if my_location
          my_location[:times] += "\n To #{origin}: #{my_stop.times.join(' ')}"
        else
          my_location = {
              name: my_stop.name,
              location: my_stop.location.to_s,
              lat: Location[my_stop.location].lat,
              long: Location[my_stop.location].long,
              times: "To #{destination == my_stop.name ? origin : destination}: #{my_stop.times.join(' ')}",
              hidden: my_stop.hidden
          }
        end
        locations << my_location
      rescue
        puts "error finding #{my_stop.location}"
      end
    end
    locations.to_json.html_safe
  end
end
