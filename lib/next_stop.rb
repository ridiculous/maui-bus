class NextStop < Struct.new(:bus_stop, :time)

  def time_to_s
    time.strftime('%-H:%M')
  end

  def <=>(other)
    time - other.time
  end

  def location
    bus_stop.try(:location)
  end

  def true_location
    bus_stop.try(:true_location)
  end

end