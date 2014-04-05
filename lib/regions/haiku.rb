class Haiku < Region

  extend RegionClassMethods

  attr_reader :islander, :commuter

  def initialize
    @islander = Islander.new
    @commuter = CommuterWailea.new
    super
  end

  class Islander < Bus::Route
    load_stops(self)

    def initialize(name='Haiku Islander Route #35')
      super
    end
  end

  class CommuterWailea < Bus::Route
    load_stops(self)

    def initialize(name='Haiku-Wailea Commuter')
      @note = 'Pick-up times listed are approximate and subject to change depending on the volume of riders and stops.'
      super
    end
  end

end