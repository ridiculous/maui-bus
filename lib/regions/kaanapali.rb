class Kaanapali < Region

  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < BasicRoute
    STOPS = [
        {
            name: 'Wharf Cinema Center Luakini Street',
            times: %w{6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:00 15:30 16:00 16:30 17:00 17:30 18:30 19:30 20:30}
        }, {
            name: 'Papalaua St.',
            times: %w{6:43 7:43 8:43 9:43 10:43 11:43 12:43 13:43 14:43 15:13 15:43 16:13 16:43 17:13 17:43 18:43 19:43 20:43}
        }, {
            name: 'Lahaina Cannery Mall',
            times: %w{6:50 7:50 8:50 9:50 10:50 11:50 12:50 13:50 14:50 15:20 15:50 16:20 16:50 17:20 17:50 18:50 19:50 20:50}
        }, {
            name: 'Whalers Village',
            times: %w{6:00 7:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 14:30 15:00 15:30 16:00 16:30 17:00 17:30 18:00 19:00 20:00 21:00}
        }, {
            name: 'Lahaina Cannery Mall',
            times: %w{6:10 7:10 8:10 9:10 10:10 11:10 12:10 13:10 14:10 14:40 15:10 15:40 16:10 16:40 17:10 18:10 19:10 20:10 21:10}
        }, {
            name: 'Papalaua St.',
            times: %w{6:20 7:20 8:20 9:20 10:20 11:20 12:20 13:20 14:20 14:50 15:20 15:50 16:20 16:50 17:20 18:20 19:20 20:20 21:20}
        }, {
            name: 'Wharf Cinema Center Luakini Street',
            times: %w{6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 14:00 15:30 15:00 16:30 16:00 17:30 18:30 19:30 20:30 21:30}
        }
    ]

    def initialize(name='Kaanapali Islander #25')
      super
    end
  end

end