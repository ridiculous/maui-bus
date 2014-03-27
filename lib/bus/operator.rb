# Kaanapali starts up another bus in the middle of the day, making this kind of complicated ...
# Options used to specify bus delay specifics: { bus: 1, start_time: ..., end_time: ... }
module Bus
  class Operator < Struct.new(:route, :total_buses, :options)
    TIME_ADVANCED = 30.minutes

    # @return 2D Array for number of buses and next stops
    def next_stops(count = 5, my_time = Time.zone.now)
      total_buses.times.map do |bus|
        delayed_bus?(bus) && !bus_active?(my_time) ? [] : upcoming_stops(bus, my_time).sort.take(count || 1000)
      end
    end

    # should look like: {"Salvation Army11:18"=>1, "Queen Kaahumanu Mall11:30"=>1}
    def next_stops_as_hash
      {}.tap do |h|
        route.next_stops_cache.each_with_index do |bus, i|
          bus.map { |nxt_stop| h[nxt_stop.to_key] = i + 1 }
        end
      end
    end

    def upcoming_stops(bus_num, my_time)
      [].tap do |nxt|
        route.stops.each do |my_stop|
          nxt_time = find_times(my_stop, bus_num, my_time).detect { |t| t >= my_time }
          if nxt_time && !nxt.find { |nx| nx.time == nxt_time }
            nxt << NextStop.new(my_stop, nxt_time, route.path_parts)
          end
        end
      end
    end

    def find_between(point_a, point_b, my_time = Time.zone.now)
      [].tap do |direct_routes|
        next_stops(nil, my_time).each_with_index do |nxt_stops, start_bus|
          # each stop for this bus
          nxt_stops.each do |nxt|
            # check for starting location
            if nxt.bus_stop.true_location == point_a
              # upcoming stops w/ the start time as the cut off, so stopping point >= starting point
              next_stops(nil, nxt.time).each_with_index do |origin_stops, stop_bus|
                stop_at = origin_stops.find { |s| s.bus_stop.true_location == point_b }
                direct_routes << DirectRoute.new(route, nxt, stop_at) if stop_at && start_bus == stop_bus
              end
            end
          end
        end
      end
    end

    def find_times(my_stop, bus, my_time)
      if total_buses > 1 && (no_delay? || bus_active?(my_time) || bus_about_active?(my_time))
        my_times = Stop.sort_times(my_stop.times_for_bus(total_buses, bus))
        if options[:end_time] && options[:bus] == bus
          my_times.reject { |t| t > options[:end_time] }
        else
          my_times
        end
      else
        my_stop.sorted_times
      end
    end

    #! -time_advanced- is to account for upcoming stops
    #
    # @param my_time {ActiveSupport::TimeWithZone}
    # @param time_advanced
    def bus_active?(my_time, time_advanced=TIME_ADVANCED)
      is_bus_active = options[:start_time] && options[:start_time] < (my_time + time_advanced)
      if is_bus_active && options[:end_time]
        options[:end_time] > my_time
      else
        is_bus_active
      end
    end

    def bus_about_active?(my_time)
      my_time < options[:end_time] && my_time >= options[:start_time] - TIME_ADVANCED
    end

    def no_delay?
      options[:start_time].nil?
    end

    def delayed_bus?(this_bus)
      options[:bus] == this_bus
    end
  end
end