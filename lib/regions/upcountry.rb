class Upcountry < Region
  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < BasicRoute
    STOPS = [
        {
            name: 'Queen Kaahumanu Center',
            times: %w{6:00 7:30 9:00 10:30 12:00 13:30 15:00 16:30 18:00 19:30 21:00}
        }, {
            name: 'Kahului Salvation Army',
            times: %w{6:03 7:33 9:03 10:33 12:03 13:33 15:03 16:33 18:03 19:33 21:03}
        }, {
            name: 'Kahului Airport Pick-up Zone #3',
            times: %w{6:10 7:40 9:10 10:40 12:10 13:40 15:10 16:40 18:10 19:40 21:10}
        }, {
            name: 'Pukalani Terrace in front Bank of Hawaii',
            times: %w{6:30 8:00 9:30 11:00 12:30 14:00 15:30 17:00 18:30 20:00 21:30}
        }, {
            name: 'Across Makawao Library',
            times: %w{6:41 8:11 9:41 11:11 12:41 14:11 15:41 17:11 18:41 20:11 21:41}
        }, {
            name: 'Haliimaile',
            times: %w{6:52 8:22 9:52 11:22 12:52 14:22 15:52 17:22 18:52 20:22 21:52}
        }, {
            name: 'Kahului Airport Pick-up Zone #3',
            times: %w{7:11 8:41 10:11 11:41 13:11 14:41 16:11 17:41 19:11 20:41 22:11}
        }, {
            name: 'Kahului Salvation Army',
            times: %w{7:20 8:50 10:20 11:50 13:20 14:50 16:20 17:50 19:20 20:50}
        }, {
            name: 'Queen Kaahumanu Center',
            times: %w{7:30 9:00 10:30 12:00 13:30 15:00 16:30 18:00 19:30 21:00}
        }
    ]

    def initialize(name='Upcountry Islander #40')
      super
    end
  end
end