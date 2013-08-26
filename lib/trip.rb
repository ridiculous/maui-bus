# Three scenarios
# 1. On same route, return DirectRoute (done)
# 2. Not on same route, but their routes have a similar transfer. Return routes and transfers (done)
# 3. Not on same route and no similar transfer. Search other routes for common transfer and return those (pending)

require 'leg'
require 'indirect_routes'
require 'voyage'

class Trip

  attr_reader :all_routes
  attr_accessor :origin, :destination, :transfers, :direct_routes, :indirect_routes, :first_legs, :last_legs, :voyages

  def initialize(origin=nil, destination=nil, custom_time=Time.zone.now) # alana_place_makawao
    @origin = origin || 'liholiho_kanaloa_ave'
    @destination = destination || 'queen_kaahumanu'
    @current_time = custom_time
    @transfers = []
    @direct_routes = []
    @indirect_routes = []
    @voyages = []
    @all_routes = Region.load_all.map(&:routes).flatten
  end

  #
  # = Direct Routes
  #

  # Loop through all routes and grab the ones that have our origin and destination in their list of stops
  def find_direct_routes
    all_routes.each do |route|
      if route.stops.find { |s| s.location.to_s.in?([origin, destination]) }
        @direct_routes.concat(route.find_between(origin, destination, current_time(route)))
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
  def find_indirect_routes
    starters = []
    find_first_and_last_legs
    reject_invalid_legs!
    last_leg_transfers = last_legs.map { |k, v| v.transfers }.flatten
    first_legs.each do |name, leg|
      start_route = find_route_by_name(name)
      leg.transfers.uniq.each do |transfer_name|
        if transfer_name.in?(last_leg_transfers) && leg.stop_at.nil?
          starters.concat(start_route.find_between(leg.start_at, leg.stop_at = transfer_name, current_time(start_route)))
        end
      end
    end

    starters.each do |dir_route|
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

  def find_voyages
    lasts = uniq_transfers(:last_legs)
    firsts = uniq_transfers(:first_legs)
    starter_routes = []
    others = {}
    all_routes.each do |r|
      starting_transfers = r.transfer_locations & firsts
      ending_transfers = r.transfer_locations & lasts
      if starting_transfers.any? && ending_transfers.any?
        others[r.name] ||= Leg.new(starting_transfers[0], ending_transfers[0])
      end
    end
    others.each do |oname, leg|
      first_legs.each do |fname, fleg|
        fleg_route = find_route_by_name(fname)
        similar_stops = fleg.transfers & [leg.start_at, leg.stop_at]
        similar_stops.each do |transfer_name|
          starter_routes.concat(fleg_route.find_between(fleg.start_at, fleg.stop_at = transfer_name, current_time(fleg_route)))
        end
      end
    end
    starter_routes.each do |start_direct_route|
      voyage = Voyage.new(start_direct_route)
      others.each do |oname, oleg|
        oroute = find_route_by_name(oname)
        voyage.leg_2 ||= oroute.find_between(oleg.start_at, oleg.stop_at, start_direct_route.stop_at.time).sort[0]
      end
      if voyage.leg_2
        last_legs.each do |name, leg|
          route = find_route_by_name(name)
          voyage.leg_3 ||= route.find_between(voyage.leg_2.stop_at.bus_stop.true_location, leg.stop_at, voyage.leg_2.stop_at.time).sort[0]
        end
      end
      voyages << voyage if voyage.complete?
    end
    voyages
  end

  def uniq_transfers(attr)
    send(attr).map { |k, v| v }.map(&:transfers).flatten.uniq
  end

  #
  # = Helpers
  #

  # search morning routes if all routes finished for the day
  def current_time(route)
    if @current_time >= route.last_stop_time
      @current_time - 18.hours
    else
      @current_time
    end
  end

  def find_route_by_name(name)
    all_routes.find { |x| x.name == name }
  end

  def reject_invalid_legs!
    [first_legs, last_legs].each do |legs|
      legs.reject! { |name, leg| leg.invalid? }
    end
  end

# collect all possible id_routes
  def find_first_and_last_legs
    @first_legs, @last_legs = {}, {}
    all_routes.each do |my_route|
      my_route.stops.each do |s|
        key = my_route.name
        location_name = s.true_location
        first_legs[key] ||= Leg.new
        last_legs[key] ||= Leg.new

        # attach as a transfer
        last_legs[key].transfers |= [location_name] if s.transfer?
        first_legs[key].transfers |= [location_name] if s.transfer?

        # attach start/stop
        if location_name == origin
          first_legs[key].start_at ||= origin
        elsif location_name == destination
          last_legs[key].stop_at ||= destination
        end
      end
    end
  end

end