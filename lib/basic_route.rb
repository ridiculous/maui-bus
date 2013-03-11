class BasicRoute
  attr_reader :name, :stops

  def initialize(name)
    @name = name
    @stops = self.class::STOPS.dup
  end

  def class_name
    self.class.to_s.sub(/^.+::/, '').downcase
  end
end