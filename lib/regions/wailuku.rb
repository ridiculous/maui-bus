class Wailuku < Region

  extend RegionClassMethods

  attr_reader :loop_one, :loop_two

  def initialize
    @loop_one = Loop1.new
    @loop_two = Loop2.new
    super
  end

  class Loop1 < BasicRoute
    STOPS = load_stops(self)

    def initialize(name='Wailuku Loop Route #1')
      super
    end
  end

  class Loop2 < BasicRoute
    STOPS = load_stops(self)

    def initialize(name='Wailuku Loop Route #2 (reverse)')
      super
    end
  end

end
