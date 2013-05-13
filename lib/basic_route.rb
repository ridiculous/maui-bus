class BasicRoute < BusRoute

  def initialize(name, bus_count=1, options={})
    @name = name
    @stops = self.class::STOPS.dup
    @bus_count = bus_count
    @options = options
  end

end