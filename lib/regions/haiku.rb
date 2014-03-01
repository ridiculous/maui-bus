class Haiku < Region

  extend RegionClassMethods

  attr_reader :islander, :commuter

  def initialize
    @islander = Islander.new
    @commuter = CommuterWailea.new
    super
  end

  class Islander < Bus::Route
    STOPS = load_stops(self)

    def initialize(name='Haiku Islander Route #35')
      super
    end
  end

  class CommuterWailea < Bus::Route
    STOPS = load_stops(self)

    def initialize(name='Haiku-Wailea Commuter')
      super
    end
  end

end