class Napili < Region
  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < BasicRoute
    STOPS = [
        BusStop.new({
                        name: 'Whalers Village',
                        times: %w{6:00 7:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00}
                    }),
        BusStop.new({
                        name: 'Kaanapali Beach Club',
                        times: %w{6:10 7:10 8:10 9:10 10:10 11:10 12:10 13:10 14:10 15:10 16:10 17:10 18:10 19:10 20:10}
                    }),
        BusStop.new({
                        name: 'Polynesian Stores',
                        times: %w{6:15 7:15 8:15 9:15 10:15 11:15 12:15 13:15 14:15 15:15 16:15 17:15 18:15 19:15 20:15}
                    }),
        BusStop.new({
                        name: 'Kahana Manor',
                        times: %w{6:17 7:17 8:17 9:17 10:17 11:17 12:17 13:17 14:17 15:17 16:17 17:17 18:17 19:17 20:17}
                    }),
        BusStop.new({
                        name: 'Napili Plaza',
                        times: %w{6:24 7:24 8:24 9:24 10:24 11:24 12:24 13:24 14:24 15:24 16:24 17:24 18:24 19:24 20:24}
                    }),
        BusStop.new({
                        name: 'Napili Kai',
                        times: %w{5:30 6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30}
                    }),
        BusStop.new({
                        name: 'Napili Shores',
                        times: %w{5:33 6:33 7:33 8:33 9:33 10:33 11:33 12:33 13:33 14:33 15:33 16:33 17:33 18:33 19:33 20:33}
                    }),
        BusStop.new({
                        name: 'Napili Plaza',
                        times: %w{5:37 6:37 7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37}
                    }),
        BusStop.new({
                        name: 'Kahana Sunset',
                        times: %w{5:40 6:40 7:40 8:40 9:40 10:40 11:40 12:40 13:40 14:40 15:40 16:40 17:40 18:40 19:40 20:40}
                    }),
        BusStop.new({
                        name: 'Valley Isle Resort',
                        times: %w{5:43 6:43 7:43 8:43 9:43 10:43 11:43 12:43 13:43 14:43 15:43 16:43 17:43 18:43 19:43 20:43}
                    }),
        BusStop.new({
                        name: 'Polynesian Stores',
                        times: %w{5:45 6:45 7:45 8:45 9:45 10:45 11:45 12:45 13:45 14:45 15:45 16:45 17:45 18:45 19:45 20:45}
                    }),
        BusStop.new({
                        name: 'Kaanapali Beach Club',
                        times: %w{5:50 6:50 7:50 8:50 9:50 10:50 11:50 12:50 13:50 14:50 15:50 16:50 17:50 18:50 19:50 20:50}
                    }),
        BusStop.new({
                        name: 'Whalers Village',
                        times: %w{6:00 7:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00}
                    })
    ]

    def initialize(name='Napili Islander Route #30')
      super
    end
  end
end