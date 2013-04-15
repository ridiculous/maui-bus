class BusRoute
  attr_reader :name, :stops

  def next_stops(count=5)
    nxt = []
    stops.each do |my_stop|
      nxt_time = my_stop.times.detect { |t| Time.parse(t) >= Time.zone.now }
      if nxt_time
        nxt << NextStop.new(my_stop, nxt_time)
        break if nxt.length == count
      end
    end
    nxt
  end

  def visible_stops
    stops.reject { |s| s.hidden }
  end

  def class_name
    self.class.to_s.sub(/^.+::/, '').downcase
  end

  class NextStop < Struct.new(:bus_stop, :time)
  end
end