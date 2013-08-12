class Bus

  attr_reader :next_stops, :path_parts # for the map path

  def initialize(nxt_stops, link_path_parts)
    @next_stops = nxt_stops
    @path_parts = link_path_parts
  end

end