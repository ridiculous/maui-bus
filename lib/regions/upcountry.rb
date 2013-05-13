class Upcountry < Region
  attr_reader :islander

  def initialize
    @islander = Islander.new
    super
  end

  class Islander < BasicRoute
    STOPS = [
        BusStop.new({
                        name: 'Queen Kaahumanu Mall',
                        times: %w{6:00 7:30 9:00 10:30 12:00 13:30 15:00 16:30 18:00 19:30 21:00},
                        location: :queen_kaahumanu
                    }),
        # to force correct route on map
        BusStop.new({
                        name: 'Back of Queen Kaahumanu',
                        location: :queen_kaahumanu_back,
                        hidden: true
                    }),
        BusStop.new({
                        name: 'Salvation Army',
                        times: %w{6:03 7:33 9:03 10:33 12:03 13:33 15:03 16:33 18:03 19:33 21:03},
                        location: :kahului_salvation_army
                    }),
        BusStop.new({
                        name: 'Safeway',
                        times: %w{6:04 7:34 9:04 10:34 12:04 13:34 15:04 16:34 18:04 19:34 21:04},
                        location: :kahului_safeway
                    }),
        BusStop.new({
                        name: 'Airport Pick-up Zone #3',
                        times: %w{6:10 7:40 9:10 10:40 12:10 13:40 15:10 16:40 18:10 19:40 21:10},
                        location: :kahului_airport
                    }),
        BusStop.new({
                        name: 'Pukalani Terrace',
                        times: %w{6:30 8:00 9:30 11:00 12:30 14:00 15:30 17:00 18:30 20:00 21:30},
                        location: :pukalani_terrace,
                        destination: true
                    }),
        BusStop.new({
                        name: 'Koehana Place / Makawao Ave',
                        times: %w{6:34 8:04 9:34 11:04 12:34 14:04 15:34 17:04 18:34 20:04 21:34},
                        location: :koehana_place_makawao
                    }),
        BusStop.new({
                        name: 'Alana Place / Makawao Ave',
                        times: %w{6:36 8:06 9:36 11:06 12:36 14:06 15:36 17:06 18:36 20:06 21:36},
                        location: :alana_place_makawao
                    }),
        BusStop.new({
                        name: 'Poalima Place / Makawao Ave',
                        times: %w{6:37 8:07 9:37 11:07 12:37 14:07 15:37 17:07 18:37 20:07 21:37},
                        location: :poalima_place_makawao
                    }),
        BusStop.new({
                        name: 'Makani Road / Makawao Ave',
                        times: %w{6:38 8:08 9:38 11:08 12:38 14:08 15:38 17:08 18:38 20:08 21:38},
                        location: :makani_road_makawao
                    }),
        BusStop.new({
                        name: 'Eddie Tam - Mahola St / Makawao Ave',
                        times: %w{6:39 8:09 9:39 11:09 12:39 14:09 15:39 17:09 18:39 20:09 21:39},
                        location: :eddie_tam
                    }),
        BusStop.new({
                        name: 'Across Makawao Library',
                        times: %w{6:41 8:11 9:41 11:11 12:41 14:11 15:41 17:11 18:41 20:11 21:41},
                        location: :makawao_library
                    }),
        BusStop.new({
                        name: 'Haliimaile',
                        times: %w{6:52 8:22 9:52 11:22 12:52 14:22 15:52 17:22 18:52 20:22 21:52},
                        location: :haliimaile
                    }),
        BusStop.new({
                        name: 'Airport Pick-up Zone #3',
                        times: %w{7:11 8:41 10:11 11:41 13:11 14:41 16:11 17:41 19:11 20:41 22:11},
                        location: :kahului_airport
                    }),
        BusStop.new({
                        name: 'Safeway / Maui Mall Entrance',
                        times: %w{7:19 8:49 10:19 11:49 13:19 14:49 16:19 17:49 19:19 20:49},
                        location: :kahului_safeway_across
                    }),
        BusStop.new({
                        name: 'Salvation Army',
                        times: ["7:20", "8:50", "10:20", "11:50", "13:20", "14:50", "16:20", "17:50", "19:20", "20:50", ''],
                        location: :kahului_salvation_army
                    }),
        BusStop.new({
                        name: 'Queen Kaahumanu Mall',
                        times: ["7:30", "9:00", "10:30", "12:00", "13:30", "15:00", "16:30", "18:00", "19:30", "21:00", ''],
                        location: :queen_kaahumanu
                    })
    ]

    def initialize(name='Upcountry Islander #40')
      super
    end
  end
end