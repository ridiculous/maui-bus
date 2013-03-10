class BusRoutes

  include Buses

  attr_accessor :current_bus, :loops, :stops

  def initialize
    @loops = Buses::LOOPS
  end

  def map_stops
    @stops ||= []
    return @stops unless @stops.empty?
    @loops.map { |region, routes| routes }.each do |route|
      route.map { |route_name, stops| stops.each_with_index { |s, index| @stops << BusStop.new(s, index) } }
    end
    @stops.flatten!
  end

  def find_stop(time=nil)
    (@stops || map_stops).each_with_index do |stop, index|
      if time && stop[:times].detect { |x| x == time }
        @current_bus = stop
        @current_bus.display_order = index
      end
    end
    @current_bus
  end

  def self.dos(time=nil)
    Buses::LOOPS.each do |region, routes|
      puts "For #{region} we have #{routes.count} routes:"
      routes.each do |route_name, stops|
        puts "#{region.to_s.titleize} #{route_name.to_s.humanize} has #{stops.count} stops:"
        stops.each do |stop|
          puts "#{stop[:name]} and #{stop[:times]}"
          if time && stop[:times].detect { |x| x == time }
            puts "FOUND #{stop}!"
            @current_bus = BusStop.new(stop)
            return
          end
        end
      end
    end
  end

  class << self
    def get_route_from_name(name)
      name.gsub(/\W/, '').underscore.intern
    end
  end
end