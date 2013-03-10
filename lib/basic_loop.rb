class BasicLoop

  attr_reader :stops, :reversed, :name

  def initialize(name, offset=0)
    @name = name
    @stops = self.class::STOPS.dup
    @stops << increment_times(@stops[0], offset)
    @reversed = false
  end

  def reverse_stops!(min=0)
    return [] if reversed
    @reversed = true
    up_times!(min).reverse!
  end

  def up_times!(min=0)
    min == 0 ? stops : stops.collect! { |route| increment_times(route, min) }
  end

  #
  # = Private methods
  #

  private

  def increment_times(route, min=0)
    dup_route = route.clone
    dup_times = dup_route[:times].clone
    dup_times.collect! do |t|
      time_pieces = t.split(':')
      hour = time_pieces[0].to_i
      minute = time_pieces[1].to_i + min
      while minute > 59
        hour += 1
        minute -= 60
      end
      hour -= 24 while hour > 23
      "#{0 if hour == 0}#{hour}:#{0 if minute.to_s.length == 1}#{minute}"
    end
    dup_route[:times] = dup_times
    dup_route
  end
end