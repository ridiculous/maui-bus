require 'direct_route'
require 'next_stop'
require 'node_map'

# Kaanapali starts up another bus in the middle of the day, making this kind of complicated ...
class BusRoute
  TIME_ADVANCED = 30.minutes

  attr_reader :_class_name, :name, :stops, :note, :bus_count
  attr_writer :buses
  attr_accessor :_visible_stops, :options

  def max_stop_length
    stops.map(&:times).map(&:length).sort[-1]
  end

  def last_stop_time
    Time.zone.parse(stops.map(&:times).flatten.reject(&:empty?).last)
  end

  def class_name
    full_class_name.sub(/^.+_/, '').downcase
  end

  def full_class_name
    @_class_name ||= self.class.to_s.downcase.sub(/::/, '_')
  end

  # path to the routes map
  def path_parts
    full_class_name.split('_')
  end

  def buses
    @buses ||= begin
      next_stops.map do |nxt|
        Bus.new(nxt, path_parts)
      end
    end
  end

  # @return _next_stops {2D Array}
  def next_stops(count = 5, current_time = Time.zone.now)
    bus_count.times.map do |bus|
      if delayed_bus?(bus) && !bus_active?(current_time)
        []
      else
        nxt = []
        stops.each do |my_stop|
          my_times = find_times(my_stop, bus, current_time)
          nxt_time = my_times.detect { |t| t >= current_time }
          if nxt_time && !nxt.find { |nx| nx.time == nxt_time }
            nxt << NextStop.new(my_stop, nxt_time)
          end
        end
        nxt.sort.slice(0, count || nxt.length)
      end
    end
  end

  def no_delay
    !options[:start_time]
  end

  def delayed_bus?(this_bus)
    options[:bus] == this_bus
  end

  #! -time_advanced- is to account for upcoming stops
  #
  # @param current_time {ActiveSupport::TimeWithZone}
  # @param time_advanced
  def bus_active?(current_time, time_advanced=TIME_ADVANCED)
    is_bus_active = options[:start_time] && options[:start_time] < (current_time + time_advanced)
    if is_bus_active && options[:end_time]
      options[:end_time] > current_time
    else
      is_bus_active
    end
  end

  def next_stops_as_hash
    nxt_ups = {}
    buses.each_with_index do |bus, i|
      bus.next_stops.map { |nxt| nxt_ups["#{nxt.bus_stop.name}#{nxt.time_to_s}"] = i + 1 }
    end
    nxt_ups
  end

  def bus_about_active?(current_time)
    current_time < options[:end_time] && current_time >= options[:start_time] - TIME_ADVANCED
  end

  def find_between(point_a, point_b, current_time=Time.zone.now)
    direct_routes = []
    next_stops(nil, current_time).each_with_index do |nxt_stops, start_bus|
      # each stop for this bus
      nxt_stops.each do |nxt|
        # check for starting location
        if nxt.bus_stop.true_location == point_a
          # upcoming stops w/ the start time as the cut off, so stopping point >= starting point
          self.next_stops(nil, nxt.time).each_with_index do |origin_stops, stop_bus|
            stop_at = origin_stops.find { |s| s.bus_stop.true_location == point_b }

            # make sure this is the same bus
            if stop_at && start_bus == stop_bus
              direct_routes << DirectRoute.new(self, nxt, stop_at)
            end

          end
        end
      end
    end
    direct_routes
  end

  def transfers
    stops.reject { |s| !s.transfer? }
  end

  def transfer_locations
    @_transfer_locations ||= transfers.map(&:location).map(&:to_s).uniq
  end

  # used in searching, data is loaded into BusData on init
  def node_map
    nm = NodeMap.new(self)
    nm.map_nodes
    nm
  end

  #
  # = Private
  #

  private

  def find_times(my_stop, bus, current_time)
    if bus_count > 1 && (no_delay || bus_active?(current_time) || bus_about_active?(current_time))
      my_times = BusStop.sort_times(my_stop.times.each_with_index.reject { |t, i| i % bus_count != bus }.map { |t| t[0] })
      if options[:end_time] && options[:bus] == bus
        my_times.reject { |t| t > options[:end_time] }
      else
        my_times
      end
    else
      my_stop.sorted_times
    end
  end
end