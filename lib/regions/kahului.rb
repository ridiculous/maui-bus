class Kahului < Region

  extend RegionClassMethods

  attr_reader :loop_five, :loop_six

  def initialize
    @loop_five = Loop5.new
    @loop_six = Loop6.new
    super
  end

  class Loop5 < BasicRoute
    STOPS = load_stops(self)

    def initialize(name='Kahului Loop Route #5')
      super
    end
  end

  # reverse
  class Loop6 < BasicRoute
    STOPS = load_stops(self)

    def initialize(name='Kahului Loop Route #6 (reverse)')
      super
    end
  end

end