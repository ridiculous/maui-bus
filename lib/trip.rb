class Trip

  attr_accessor :origin, :destination, :transfers

  def initialize(origin=:liholiho_kanaloa_ave, destination=:alana_place_makawao)
    @origin = origin
    @destination = destination
    @transfers = []
  end

  # Loop through all routes and grab the ones that have our origin and destination in their list of stops
  def find_routes
    routes = Region.load_all.map(&:routes).flatten
    direct_routes = []
    routes.each do |my_route|
      locations = my_route.stops.map(&:location)
      if locations.include?(origin)
        
        if locations.include?(destination)
          direct_routes << my_route
        end

      end
    end
  end

  # Three scenarios
  # 1. On same route. Just return the finishers
  # 2. Not on same route, but their routes have a similar transfer. Return routes and transfers
  # 3. Not on same route and no similar transfer. Search other routes for common transfer and return those
  def plot_course

  end

  class Run < Struct.new(:route, :transfers)
    def name
      route.name
    end
  end

end