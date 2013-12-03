class Leg < Struct.new(:name, :start_at, :stop_at)

  def valid?
    !stop_at.nil? || !start_at.nil?
  end

  def invalid?
    !valid?
  end

  def complete?
    !stop_at.nil? && !start_at.nil?
  end

  def incomplete?
    !complete?
  end

  def has_same_points?
    start_at == stop_at
  end

  def find_stops(start_time)
    route.find_between(start_at, stop_at, start_time)
  end

  def route
    BusData.routes.find { |x| x.name == name }
  end

end