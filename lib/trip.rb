# Three scenarios
# 1. On same route, return DirectRoute (done)
# 2. Not on same route, but their routes have a similar transfer. Return routes and transfers
# 3. Not on same route and no similar transfer. Search other routes for common transfer and return those

class Trip

  attr_accessor :origin, :destination, :transfers, :direct_routes, :indirect_routes

  def initialize(origin=nil, destination=nil) # alana_place_makawao
    @origin = origin || 'liholiho_kanaloa_ave'
    @destination = destination || 'queen_kaahumanu'
    @transfers = []
    @direct_routes = []
    @indirect_routes = []
  end

  #
  # Direct Routes
  #

  # Loop through all routes and grab the ones that have our origin and destination in their list of stops
  def find_direct_routes(current_time=Time.zone.now)
    @direct_routes = Region.load_all.map(&:routes).flatten.map { |route| route.find_between(origin, destination, current_time) }.flatten
  end

  # get most direct route for each bus
  def prioritize
    direct_routes.group_by(&:name).map { |name, my_direct_routes| my_direct_routes.sort.first }
  end

  #
  # Indirect Routes and Transfers
  #

  # find and save bus routes that include -origin- or -destination- in list of stops
  # and then join them together on the their transfer points
  def find_indirect_routes(current_time=Time.zone.now)
    Region.load_all.map(&:routes).flatten.each do |my_route|
      my_route.next_stops(nil, current_time).each do |nxt_stops|
        # each stop for this bus
        nxt_stops.each do |nxt|
          # check for starting location
          if true_name(nxt.bus_stop.location) == origin
            indirect_routes << '...'
          end
        end
      end
    end
    indirect_routes
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