class Trip::DirectRoute

  attr_reader :route, :start_at, :stop_at, :rank

  def initialize(route, start_at, stop_at)
    @route = route
    @start_at = start_at
    @stop_at = stop_at
    @rank = stop_at.time - start_at.time
  end

  def name
    route.name
  end

  # called by Array#sort
  def <=>(other)
    rank - other.rank
  end
end