class Kaanapali < Region

  extend RegionClassMethods

  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < BasicRoute
    STOPS = load_stops(self)

    def initialize(name='Kaanapali Islander #25')
      # route, bus_count, and delay bus #2 until 2:30pm
      super(name, 2, {
          bus: 1, start_time: Time.zone.parse('14:30'),
          end_time: Time.zone.parse('17:31')
      })
    end
  end

end