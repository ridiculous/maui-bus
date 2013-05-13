class Bus

  attr_reader :next_stops, :path_parts # for the map path

  def initialize(nxt_stops, full_route_name)
    @next_stops = nxt_stops
    @path_parts = full_route_name.split('_')
  end

end