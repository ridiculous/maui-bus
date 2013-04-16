module BusRoutesHelper

  def locations_as_json
    locations = []
    origin = @bus.stops[0].name
    destination = @bus.stops.detect { |s| s.destination }.name
    destination_reached = false
    @bus.stops.each do |my_stop|
      begin
        my_location = locations.find { |loc| loc[:name] == my_stop.name }
        my_times = my_stop.times.map { |t| Time.zone.parse(t).strftime('%l:%M %p') }.join(', ')
        if my_location
          my_location[:times] += "<br /><b>To #{origin}</b>: #{my_times}" unless origin == my_stop.name
        else
          destination_reached = true if destination == my_stop.name && !destination_reached
          my_location = {
              name: my_stop.name,
              location: my_stop.location.to_s,
              lat: Location[my_stop.location].lat,
              long: Location[my_stop.location].long,
              times: "<b>To #{destination_reached ? origin : destination}</b>: #{my_times}",
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
