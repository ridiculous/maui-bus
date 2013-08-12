# The fact that Kaanapali starts up another bus in the middle of the day made this code kind of complicated ...
class BusRoute
  TIME_ADVANCED = 30.minutes

  class NextStop < Struct.new(:bus_stop, :time)

    def time_to_s
      time.strftime('%-H:%M')
    end

  end

  attr_reader :_class_name, :name, :stops, :note, :bus_count
  attr_writer :buses
  attr_accessor :_visible_stops, :options

  def max_stop_length
    stops.map(&:times).map(&:length).sort[-1]
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
  def next_stops(count=5)
    current_time = Time.zone.now
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
        nxt.sort { |a, b| a.time <=> b.time }.slice(0, count || nxt.length)
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