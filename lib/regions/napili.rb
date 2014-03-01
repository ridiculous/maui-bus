class Napili < Region

  extend RegionClassMethods

  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < Bus::Route
    STOPS = load_stops(self)

    def initialize(name='Napili Islander Route #30')
      super
    end
  end
end