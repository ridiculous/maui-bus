class BusRoute
  attr_reader :name, :stops, :_class_name

  attr_accessor :_visible_stops

  def next_stops(count=5)
    nxt = []
    stops.each do |my_stop|
      nxt_time = my_stop.times.detect { |t| Time.zone.parse(t) >= Time.zone.now }
      if nxt_time && !nxt.find { |nx| nx.time == nxt_time }
        nxt << NextStop.new(my_stop, nxt_time)
      end
    end
    nxt.sort { |a, b| a.time <=> b.time }.slice(0, count)
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
    @_class_name ||= self.class.to_s.sub(/::/,'_').downcase
  end

  class NextStop < Struct.new(:bus_stop, :time)
  end
end