class Lahaina < Region

  attr_reader :islander, :villager

  def initialize
    @islander = Islander.new
    @villager = Villager.new
    super
  end

  # basic loop adds one extra stop which is the same as the first but incremented
  class Islander < BasicLoop
    STOPS = [
        BusStop.new({
                        name: 'Queen Kaahumanu Mall',
                        times: %w{5:30 6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30},
                        location: :queen_kaahumanu
                    }),
        BusStop.new({
                        name: 'State Office Building and Wells St.',
                        times: %w{5:40 6:40 7:40 8:40 9:40 10:40 11:40 12:40 13:40 14:40 15:40 16:40 17:40 18:40 19:40},
                        location: :state_bldg_wells_st
                    }),
        BusStop.new({
                        name: 'Maalaea Harbor Village',
                        times: %w{5:55 6:55 7:55 8:55 9:55 10:55 11:55 12:55 13:55 14:55 15:55 16:55 17:55 18:55 19:55},
                        location: :maalaea_harbor
                    }),
        BusStop.new({
                        name: 'Wharf Cinema Center',
                        times: %w{6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30},
                        location: :wharf_cinema,
                        destination: true
                    }),
        BusStop.new({
                        name: 'Maalaea Harbor Village',
                        times: %w{7:05 8:05 9:05 10:05 11:05 12:05 13:05 14:05 15:05 16:05 17:05 18:05 19:05 20:05 21:05},
                        location: :maalaea_harbor
                    }),
        BusStop.new({
                        name: 'State Office Building',
                        times: %w{7:18 8:18 9:18 10:18 11:18 12:18 13:18 14:18 15:18 16:18 17:18 18:18 19:18 20:18 21:18},
                        location: :state_bldg
                    })
    ]

    def initialize(name='Lahaina Islander #20')
      super(name, 120) # loop offset
    end
  end

  class Villager < BasicLoop
    STOPS = [
        BusStop.new({
                        name: 'Wharf Cinema Center Luakini Street',
                        times: %w{8:00 9:00 10:00 11:00 12:00 13:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00 22:00},
                        location: :wharf_cinema
                    }),
        BusStop.new({
                        name: '505 Front Street',
                        times: %w{8:04 9:04 10:04 11:04 12:04 13:04 15:04 16:04 17:04 18:04 19:04 20:04 21:04 22:04},
                        location: :front_street_505
                    }),
        BusStop.new({
                        name: 'Lahaina Aquatics Center',
                        times: %w{8:09 9:09 10:09 11:09 12:09 13:09 15:09 16:09 17:09 18:09 19:09 20:09 21:09 22:09},
                        location: :lahaina_aquatic_center
                    }),
        BusStop.new({
                        name: 'Kuailua Street / Kumukahi Street',
                        times: %w{8:15 9:15 10:15 11:15 12:15 13:15 15:15 16:15 17:15 18:15 19:15 20:15 21:15 22:15},
                        location: :kuailua_kumukahi_lahaina
                    }),
        BusStop.new({
                        name: 'Kalena Street / Pikanele Street',
                        times: %w{8:17 9:17 10:17 11:17 12:17 13:17 15:17 16:17 17:17 18:17 19:17 20:17 21:17 22:17},
                        location: :kalena_pikanele_lahaina
                    }),
        BusStop.new({
                        name: 'Lahaina Gateway',
                        times: %w{8:23 9:23 10:23 11:23 12:23 13:23 15:23 16:23 17:23 18:23 19:23 20:23 21:23 22:23},
                        location: :lahaina_gateway
                    }),
        BusStop.new({
                        name: 'Ainakea Road / Malolo St.',
                        times: %w{8:26 9:26 10:26 11:26 12:26 13:26 15:26 16:26 17:26 18:26 19:26 20:26 21:26 22:26},
                        location: :ainakea_malolo_lahaina
                    }),
        BusStop.new({
                        name: 'Ainakea Road / Fleming Road',
                        times: %w{8:27 9:27 10:27 11:27 12:27 13:27 15:27 16:27 17:27 18:27 19:27 20:27 21:27 22:27},
                        location: :ainakea_fleming_lahaina
                    }),
        BusStop.new({
                        name: 'Ainakea Park',
                        times: %w{8:28 9:28 10:28 11:28 12:28 13:28 15:28 16:28 17:28 18:28 19:28 20:28 21:28 22:28},
                        location: :ainakea_park_lahaina
                    }),
        BusStop.new({
                        name: 'Ainakea Road / Kaniau Road',
                        times: %w{8:29 9:29 10:29 11:29 12:29 13:29 15:29 16:29 17:29 18:29 19:29 20:29 21:29 22:29},
                        location: :ainakea_kaniau_lahaina
                    }),
        BusStop.new({
                        name: 'Leialii Parkway / Near Hooli Street',
                        times: %w{8:31 9:31 10:31 11:31 12:31 13:31 15:31 16:31 17:31 18:31 19:31 20:31 21:31 22:31},
                        location: :leialii_parkway_lahaina
                    }),
        BusStop.new({
                        name: 'Lahaina Civic Center (back)',
                        times: %w{8:34 9:34 10:34 11:34 12:34 13:34 15:34 16:34 17:34 18:34 19:34 20:34 21:34 22:34},
                        location: :lahaina_civic_center
                    }),
        BusStop.new({
                        name: 'Lahaina Cannery Mall',
                        times: %w{8:42 9:42 10:42 11:42 12:42 13:42 15:42 16:42 17:42 18:42 19:42 20:42 21:42 22:42},
                        location: :lahaina_cannery_mall
                    }),
        BusStop.new({
                        name: 'Papalaua Street',
                        times: %w{8:48 9:48 10:48 11:48 12:48 13:48 15:48 16:48 17:48 18:48 19:48 20:48 21:48 22:48},
                        location: :papalaua_st
                    })
    ]

    def initialize(name='Lahaina Villager #23')
      super(name, 60)
    end
  end

end