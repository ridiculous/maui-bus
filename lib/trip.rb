class Trip

  attr_accessor :origin, :destination, :starters, :finishers, :transfers

  # @param origin {Symbol|:queen_kaahumanu}
  # @param destination {Symbol|:pukalani_terrace}
  def initialize(origin='liholiho_kanaloa_ave', destination='alana_place_makawao')
    @origin = origin.intern
    @destination = destination.intern
    @starters, @finishers, @transfers = [], [], []
  end

  # Loop through all routes and grab the ones that have our origin and destination in their list of stops
  def find_routes
    routes = Region.load_all.map(&:routes).flatten
    routes.each do |rt|
      locations = rt.stops.map(&:location)
      starters << Run.new(rt, Location.transfers_only(locations)) if locations.include?(origin)
      finishers << Run.new(rt, Location.transfers_only(locations)) if locations.include?(destination)
    end
  end

  # three scenarios
  # 1. On same route. Just return the finishers
  # 2. Not on same route, but their routes have a similar transfer. Return routes and transfers
  # 3. Not on same route and no similar transfer. Search other routes for common transfer and return those
  def plot_course
    if same_route?
      self.journies = finishers.map{ |f| Journey.new(f) }
    else

    end
  end

  def same_route?
    (starters.map(&:name) & finishers.map(&:name)).any?
  end

  class Run < Struct.new(:route, :transfers)
    def name
      route.name
    end
  end

  class Journey
    attr_reader :routes, :transfers

    def initialize(routes, transfers=[])
      @routes = routes
      @transfers = transfers
    end
  end

end