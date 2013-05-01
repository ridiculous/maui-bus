class BusRoute
  attr_reader :name, :stops

  attr_accessor :_visible_stops

  def next_stops(count=5)
    nxt = []
    stops.each do |my_stop|
      nxt_time = my_stop.times.detect { |t| Time.parse(t) >= Time.zone.now }
      if nxt_time
        nxt << NextStop.new(my_stop, nxt_time, Location[my_stop.location].try(:coords))
        break if nxt.length == count
      end
    end
    nxt
  end

  def max_stop_length
    visible_stops.map(&:times).map(&:length).sort[-1]
  end

  def visible_stops
    @_visible_stops ||= stops.reject { |s| s.hidden }
  end

  def class_name
    self.class.to_s.sub(/^.+::/, '').downcase
  end

  class NextStop < Struct.new(:bus_stop, :time, :coords)
  end
end