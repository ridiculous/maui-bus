class Upcountry < Region

  extend RegionClassMethods

  attr_reader :islander, :commuter

  def initialize
    @islander = Islander.new
    @commuter = CommuterKapalua.new
    super
  end

  class Islander < Bus::Route
    load_stops(self)

    def initialize(name='Upcountry Islander #40')
      super
    end
  end

  class CommuterKapalua < Bus::Route
    load_stops(self)

    def initialize(name='Makawao-Kapalua Commuter')
      @note = 'Pick-up times listed are approximate and subject to change depending on the volume of riders and stops.'
      super
    end
  end
end