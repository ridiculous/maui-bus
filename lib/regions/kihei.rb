class Kihei < Region

  extend RegionClassMethods

  attr_reader :islander, :villager, :commuter

  def initialize
    @islander = Islander.new
    @villager = Villager.new
    @commuter = CommuterKapalua.new
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

  class CommuterKapalua < Bus::Route
    load_stops(self)

    def initialize(name='Kihei-Kapalua Commuter')
      super
    end
  end

end