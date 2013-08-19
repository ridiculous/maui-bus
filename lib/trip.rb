# Three scenarios
# 1. On same route, return DirectRoute (done)
# 2. Not on same route, but their routes have a similar transfer. Return routes and transfers
# 3. Not on same route and no similar transfer. Search other routes for common transfer and return those

class Trip

  attr_accessor :origin, :destination, :transfers, :direct_routes

  def initialize(origin=nil, destination=nil) #alana_place_makawao
    @origin = origin || 'liholiho_kanaloa_ave'
    @destination = destination || 'queen_kaahumanu'
    @transfers = []
    @direct_routes = []
  end

  #
  # Direct Routes
  #

  # Loop through all routes and grab the ones that have our origin and destination in their list of stops
  def find_direct_routes(current_time=Time.zone.now)
    routes = Region.load_all.map(&:routes).flatten
    routes.each do |my_route|
      my_route.next_stops(nil, current_time).each do |nxt_stops|
        # each stop for this bus
        nxt_stops.each do |nxt|
          # check for starting location
          if true_name(nxt.bus_stop.location) == origin
            # upcoming stops w/ the start time as the cut off, so stopping point >= starting point
            my_route.next_stops(nil, nxt.time).each do |origin_stops|
              stop_at = origin_stops.find { |s| true_name(s.bus_stop.location) == destination }
              if stop_at
                direct_routes << DirectRoute.new(my_route, nxt, stop_at)
              end
            end
          end
        end
      end
    end
    direct_routes
  end

  # get most direct route for each bus
  def prioritize
    direct_routes.group_by(&:name).map { |name, my_direct_routes| my_direct_routes.sort.first }
  end

  # remove mauka, makai, across, etc from the location name
  def true_name(name)
    name.to_s.sub(Location::PARTNER_PATTERN, '')
  end

  #
  # Pre-test tests
  #

  def self.test
    noon = Time.zone.parse('Sun, 18 Aug 2013 12:00:00')
    @trip = new('kahului_airport', 'queen_kaahumanu')
    @trip.find_direct_routes(noon)
    @trip
  end

end