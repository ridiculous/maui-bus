class Kihei < Region

  extend RegionClassMethods

  attr_reader :islander, :villager

  def initialize
    @islander = Islander.new
    @villager = Villager.new
    super
  end

  class Islander < Bus::Route
    load_stops(self)

    def initialize(name='Kihei Islander Route #10')
      super(name, 2) # name and # of buses
    end
  end

  class Villager < Bus::Route
    load_stops(self)

    def initialize(name='Kihei Villager Route #15')
      super
    end
  end

end