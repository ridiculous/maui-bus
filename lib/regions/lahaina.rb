class Lahaina < Region

  extend RegionClassMethods

  attr_reader :islander, :villager

  def initialize
    @islander = Islander.new
    @villager = Villager.new
    super
  end

  #
  # Lahaina Islander #20
  #
  class Islander < BasicRoute
    STOPS = load_stops(self)

    def initialize(name='Lahaina Islander #20')
      super(name, 2) # name and # of buses
    end
  end

  #
  # Lahaina Villager #23
  #

  class Villager < BasicRoute
    STOPS = load_stops(self)

    def initialize(name='Lahaina Villager #23')
      super
    end
  end

end