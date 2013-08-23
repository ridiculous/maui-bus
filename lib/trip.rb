# Three scenarios
# 1. On same route, return DirectRoute (done)
# 2. Not on same route, but their routes have a similar transfer. Return routes and transfers (done)
# 3. Not on same route and no similar transfer. Search other routes for common transfer and return those (pending)

require 'leg'
require 'indirect_routes'

class Trip

  attr_reader :all_routes
  attr_accessor :origin, :destination, :transfers, :direct_routes, :indirect_routes

  def initialize(origin=nil, destination=nil) # alana_place_makawao
    @origin = origin || 'liholiho_kanaloa_ave'
    @destination = destination || 'queen_kaahumanu'
    @transfers = []
    @direct_routes = []
    @indirect_routes = []
    @all_routes = Region.load_all.map(&:routes).flatten
  end

  #
  # = Direct Routes
  #

  # Loop through all routes and grab the ones that have our origin and destination in their list of stops
  def find_direct_routes(current_time=Time.zone.now)
    all_routes.each do |route|
      if route.stops.find { |s| s.location.to_s.in?([origin, destination]) }
        @direct_routes.concat(route.find_between(origin, destination, current_time))
      end
    end
  end

  # get most direct route for each bus
  def prioritize
    direct_routes.group_by(&:name).map { |name, my_direct_routes| my_direct_routes.sort.first }
  end

  #
  # = Indirect Routes and Transfers
  #

  # find and save bus routes that include -origin- or -destination- in list of stops
  # and then join them together on the their transfer points
  # ASSUMES there is no direct route between origin and destination
  def find_indirect_routes(current_time=Time.zone.now)
    first_legs = []
    start_legs, last_legs = first_and_last_legs
    last_leg_transfers = last_legs.map { |k, v| v.transfers }.flatten

    start_legs.each do |name, leg|
      start_route = find_route_by_name(name)
      leg.transfers.uniq.each do |transfer_name|
        if transfer_name.in?(last_leg_transfers) && leg.stop_at.nil?
          first_legs.concat(start_route.find_between(leg.start_at, leg.stop_at = transfer_name, current_time))
        end
      end
    end

    first_legs.each do |dir_route|
      ir = IndirectRoute.new(dir_route)
      last_legs.each do |name, leg|
        route = find_route_by_name(name)
        leg.transfers.map do |transfer_name|
          if transfer_name == dir_route.stop_at.bus_stop.true_location
            route.find_between(transfer_name, leg.stop_at, dir_route.stop_at.time).each do |my_dr|
              ir.point_bs.concat(Array(my_dr))
            end
          end
        end
      end
      @indirect_routes << ir if ir.point_bs.any?
    end

    @indirect_routes
  end

  #
  # = Helpers
  #

  def find_route_by_name(name)
    all_routes.find { |x| x.name == name }
  end

  # collect all possible id_routes and then reject invalid ones (neither start or stop)
  def first_and_last_legs
    start_legs, last_legs = {}, {}
    all_routes.each do |my_route|
      my_route.stops.each do |s|
        key = my_route.name
        location_name = s.true_location
        start_legs[key] ||= Leg.new
        last_legs[key] ||= Leg.new

        # attach as a transfer
        last_legs[key].transfers |= [location_name] if s.transfer?
        start_legs[key].transfers |= [location_name] if s.transfer?

        # attach start/stop
        if location_name == origin
          start_legs[key].start_at ||= origin
        elsif location_name == destination
          last_legs[key].stop_at ||= destination
        end
      end
    end

    [start_legs, last_legs].each do |leg|
      leg.reject! { |name, l| l.invalid? }
    end
  end

end