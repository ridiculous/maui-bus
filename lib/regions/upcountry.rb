class Upcountry < Region

  extend RegionClassMethods

  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < Bus::Route
    load_stops(self)

    def initialize(name='Upcountry Islander #40')
      super
    end
  end
end