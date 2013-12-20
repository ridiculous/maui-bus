class Haiku < Region

  extend RegionClassMethods

  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < BasicRoute
    STOPS = load_stops(self)

    def initialize(name='Haiku Islander Route #35')
      super
    end

  end

end