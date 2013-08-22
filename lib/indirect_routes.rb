class IndirectRoute
  attr_reader :point_a, :point_bs

  # @param leg1 {DirectRoute}
  # @param others {Array of DirectRoutes}
  def initialize(leg1=nil, others=nil)
    @point_a = leg1
    @point_bs = others || []
  end

  def sorted_point_bs
    point_bs.sort_by { |t| t.stop_at.time }
  end

end