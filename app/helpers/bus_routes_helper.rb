module BusRoutesHelper

  def locations_as_json
    locations = []
    @bus.stops.each do |my_stop|
      begin
        my_location = locations.find { |loc| loc[:name] == my_stop.name }
        if my_location
          my_location[:times] += "\n Returning: #{my_stop.times.join(' ')}"
        else
          my_location = {
              name: my_stop.name,
              lat: Location[my_stop.location].lat,
              long: Location[my_stop.location].long,
              times: "Departing: #{my_stop.times.join(' ')}"
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
