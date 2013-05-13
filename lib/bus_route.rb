class BusRoute
  attr_reader :_class_name, :name, :stops, :note, :bus_count

  attr_writer :buses

  attr_accessor :_visible_stops, :options

  def max_stop_length
    visible_stops.map(&:times).map(&:length).sort[-1]
  end

  def visible_stops
    @_visible_stops ||= stops.reject { |s| s.hidden }
  end

  def class_name
    full_class_name.sub(/^.+_/, '').downcase
  end

  def full_class_name
    @_class_name ||= self.class.to_s.downcase.sub(/::/, '_')
  end

  def buses
    @buses ||= begin
      next_stops.map do |nxt|
        Bus.new(nxt, full_class_name)
      end
    end
  end

  # @return _next_stops {2D Array}
  def next_stops(count=5)
    current_time = Time.zone.now

    bus_count.times.reject { |bus| options[:bus] == bus && !ready?(current_time) }.map do |bus|
      nxt = []
      stops.each do |my_stop|
        my_times = if bus_count > 1 && (no_delay || ready?(current_time))
                     BusStop.sort_times(my_stop.times.each_with_index.reject { |t, i| i % bus_count != bus }.map { |t| t[0] })
                   else
                     my_stop.sorted_times
                   end
        nxt_time = my_times.detect { |t| t >= current_time }
        if nxt_time && !nxt.find { |nx| nx.time == nxt_time }
          nxt << NextStop.new(my_stop, nxt_time)
        end
      end
      nxt.sort { |a, b| a.time <=> b.time }.slice(0, count)
    end
  end

  def no_delay
    !options[:delay]
  end

  def ready?(current_time)
    options[:delay] && options[:delay] < current_time
  end

  def next_stops_as_hash
    nxt_ups = {}
    buses.each_with_index do |bus, i|
      bus.next_stops.map { |nxt| nxt_ups["#{nxt.bus_stop.name}#{nxt.time_to_s}"] = i + 1 }
    end
    nxt_ups
  end

  class NextStop < Struct.new(:bus_stop, :time)

    def time_to_s
      time.strftime('%H:%M')
    end
  end
end