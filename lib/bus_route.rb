class BusRoute
  attr_reader :name, :stops, :_class_name

  attr_accessor :_visible_stops, :_next_stops

  def next_stops(count=5)
    @_next_stops ||= begin
      nxt = []
      current_time = Time.zone.now
      stops.each do |my_stop|
        my_times = my_stop.sorted_times
        nxt_time = my_times.detect { |t| t >= current_time }
        if nxt_time && !nxt.find { |nx| nx.time == nxt_time }
          nxt << NextStop.new(my_stop, nxt_time)
        end
      end
      nxt.sort { |a, b| a.time <=> b.time }.slice(0, count)
    end
  end

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
    @_class_name ||= self.class.to_s.sub(/::/, '_').downcase
  end

  class NextStop < Struct.new(:bus_stop, :time)
  end
end