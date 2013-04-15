class BasicRoute < BusRoute

  def initialize(name)
    @name = name
    @stops = self.class::STOPS.dup
  end

end