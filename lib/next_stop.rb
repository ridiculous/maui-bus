class NextStop < Struct.new(:bus_stop, :time)

  def time_to_s
    time.strftime('%-H:%M')
  end

  def <=>(other)
    time - other.time
  end

end