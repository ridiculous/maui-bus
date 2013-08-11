class Trip

  attr_accessor :origin, :destination, :transfers

  def initialize(origin=nil, destination=nil) #alana_place_makawao
    @origin = (origin || :liholiho_kanaloa_ave).to_sym
    @destination = (destination || :queen_kaahumanu).to_sym
    @transfers = []
  end

  # Loop through all routes and grab the ones that have our origin and destination in their list of stops
  def find_direct_routes
    routes = Region.load_all.map(&:routes).flatten
    direct_routes = []
    routes.each do |my_route|
      start_at = my_route.stops.find { |s| true_name(s.location) == true_name(origin) }
      if start_at
        stop_at = my_route.stops.find { |s| true_name(s.location) == true_name(destination) }
        if stop_at
          direct_routes << DirectRoute.new(my_route, start_at, stop_at)
        end
      end
    end
    direct_routes
  end

  # helpers
  def true_name(name)
    name.to_s.sub(Location::PARTNER_PATTERN, '')
  end

  # Three scenarios
  # 1. On same route, return DirectRoute (done)
  # 2. Not on same route, but their routes have a similar transfer. Return routes and transfers
  # 3. Not on same route and no similar transfer. Search other routes for common transfer and return those

  class DirectRoute < Struct.new(:route, :start_at, :stop_at)
    def name
      route.name
    end
  end

end