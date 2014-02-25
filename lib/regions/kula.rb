class Kula < Region

  extend RegionClassMethods

  attr_reader :villager

  def initialize
    @villager = Villager.new
    super
  end

  class Villager < Bus::Route
    STOPS = load_stops(self)

    def initialize(name='Kula Villager Route #39')
      super
    end
  end
end