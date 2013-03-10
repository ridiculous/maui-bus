class Haiku < Region

  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < BasicRoute
    STOPS = [
        {
            name: 'Queen Kaahumanu Center',
            times: %w{5:30 7:00 8:30 10:00 11:30 13:00 14:30 16:00 17:30 19:00 20:30}
        }, {
            name: 'Kahului Salvation Army',
            times: %w{5:33 7:03 8:33 10:03 11:33 13:03 14:33 16:03 17:33 19:03 20:33}
        }, {
            name: 'Kahului Airport Pick-up Zone #3',
            times: %w{5:40 7:10 8:40 10:10 11:40 13:10 14:40 16:10 17:40 19:10 20:40}
        }, {
            name: 'Paia Town',
            times: %w{5:53 7:23 8:53 10:23 11:53 13:23 14:53 16:23 17:53 19:23 20:53}
        }, {
            name: 'Haiku Marketplace',
            times: %w{6:11 7:41 9:11 10:41 12:11 13:41 15:11 16:41 18:11 19:41 21:11}
        }, {
            name: 'Shelter Next to Haiku Community Center',
            times: %w{6:17 7:47 9:17 10:47 12:17 13:47 15:17 16:47 18:17 19:47 21:17}
        }, {
            name: 'Paia Town',
            times: %w{6:29 7:59 9:29 10:59 12:29 13:59 15:29 16:59 18:29 19:59 21:29}
        }, {
            name: 'Kahului Airport Pick-up Zone #3',
            times: %w{6:43 8:13 9:43 11:13 12:43 12:13 15:43 17:13 18:43 20:13 21:43}
        }, {
            name: 'Kahului Salvation Army',
            times: %w{6:48 8:18 9:48 11:18 12:48 12:18 15:48 17:18 18:48 20:18}
        }, {
            name: 'Queen Kaahumanu Center',
            times: %w{7:00 8:30 10:00 11:30 13:00 14:30 16:00 17:30 19:00 20:30}
        }
    ]

    def initialize(name='Haiku Islander Route #35')
      super
    end

  end

end