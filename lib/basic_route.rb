class BasicRoute
  attr_reader :name, :stops

  def initialize(name)
    @name = name
    @stops = self.class::STOPS.dup
  end
end