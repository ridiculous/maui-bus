class DirectRoute

  attr_reader :route, :start_at, :stop_at, :rank

  def initialize(route, start_at, stop_at)
    @route = route
    @start_at = start_at
    @stop_at = stop_at
    @rank = (stop_at.time.to_f * 2) - start_at.time.to_f
  end

  def name
    route.name
  end

  # called by Array#sort
  def <=>(other)
    rank - other.rank
  end
end