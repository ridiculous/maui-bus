class Kihei < Region

  attr_reader :islander, :villager

  def initialize
    @islander = Islander.new
    @villager = Villager.new
    super
  end

  class Islander < BasicLoop
    STOPS = [
        BusStop.new({
                        name: 'Queen Kaahumanu Mall',
                        times: %w{5:30 6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30},
                        location: :queen_kaahumanu
                    }),
        BusStop.new({
                        name: 'Salvation Army',
                        times: %w{5:35 6:35 7:35 8:35 9:35 10:35 11:35 12:35 13:35 14:35 15:35 16:35 17:35 18:35 19:35},
                        location: :kahului_salvation_army
                    }),
        BusStop.new({
                        name: 'Uwapo Rd. / S. Kihei Rd.',
                        times: %w{5:50 6:50 7:50 8:50 9:50 10:50 11:50 12:50 13:50 14:50 15:50 16:50 17:50 18:50 19:50},
                        location: :uwapo_south_kihei
                    }),
        BusStop.new({
                        name: 'Ohukai Rd. / S. Kihei Rd.',
                        times: %w{5:52 6:52 7:52 8:52 9:52 10:52 11:52 12:52 13:52 14:52 15:52 16:52 17:52 18:52 19:52},
                        location: :ohukai_south_kihei
                    }),
        BusStop.new({
                        name: 'Kaonoulu Rd. / S. Kihei Rd.',
                        times: %w{5:54 6:54 7:54 8:54 9:54 10:54 11:54 12:54 13:54 14:54 15:54 16:54 17:54 18:54 19:54},
                        location: :kaonoulu_south_kihei_makai
                    }),
        BusStop.new({
                        times: %w{5:55 6:55 7:55 8:55 9:55 10:55 11:55 12:55 13:55 14:55 15:55 16:55 17:55 18:55 19:55},
                        location: :kulanihakoi_south_kihei
                    }),
        BusStop.new({
                        times: %w{5:57 6:57 7:57 8:57 9:57 10:57 11:57 12:57 13:57 14:57 15:57 16:57 17:57 18:57 19:57},
                        location: :waipuilani_south_kihei_makai
                    }),
        BusStop.new({
                        times: %w{5:58 6:58 7:58 8:58 9:58 10:58 11:58 12:58 13:58 14:58 15:58 16:58 17:58 18:58 19:58},
                        location: :piikea_south_kihei_across
                    }),
        BusStop.new({
                        name: 'Piilani Shopping Center',
                        times: %w{6:03 7:03 8:03 9:03 10:03 11:03 12:03 13:03 14:03 15:03 16:03 17:03 18:03 19:03 20:03},
                        location: :piilani_shopping_center
                    }),
        BusStop.new({
                        name: 'Lipoa St. / Haggai Institute',
                        times: %w{6:04 7:04 8:04 9:04 10:04 11:04 12:04 13:04 14:04 15:04 16:04 17:04 18:04 19:04 20:04},
                        location: :lipoa_liloa
                    }),
        BusStop.new({
                        name: "St Theresa's Church / S. Kihei Rd.",
                        times: %w{6:07 7:07 8:07 9:07 10:07 11:07 12:07 13:07 14:07 15:07 16:07 17:07 18:07 19:07 20:07},
                        location: :st_theresas_church
                    }),
        BusStop.new({
                        name: 'Welakahao Rd. / S. Kihei Rd.',
                        times: %w{6:10 7:10 8:10 9:10 10:10 11:10 12:10 13:10 14:10 15:10 16:10 17:10 18:10 19:10 20:10},
                        location: :welakahao_south_kihei
                    }),
        BusStop.new({
                        name: 'Keala Pl. / S. Kihei Rd. Kalama Park',
                        times: %w{6:12 7:12 8:12 9:12 10:12 11:12 12:12 13:12 14:12 15:12 16:12 17:12 18:12 19:12 20:12},
                        location: :keala_place_south_kihei
                    }),
        BusStop.new({
                        times: %w{6:14 7:14 8:14 9:14 10:14 11:14 12:14 13:14 14:14 15:14 16:14 17:14 18:14 19:14 20:14},
                        location: :walaka_south_kihei
                    }),
        BusStop.new({
                        times: %w{6:17 7:17 8:17 9:17 10:17 11:17 12:17 13:17 14:17 15:17 16:17 17:17 18:17 19:17 20:17},
                        location: :kamaole_beach_1
                    }),
        BusStop.new({
                        times: %w{6:19 7:19 8:19 9:19 10:19 11:19 12:19 13:19 14:19 15:19 16:19 17:19 18:19 19:19 20:19},
                        location: :kamaole_shopping_center
                    }),
        BusStop.new({
                        times: %w{6:20 7:20 8:20 9:20 10:20 11:20 12:20 13:20 14:20 15:20 16:20 17:20 18:20 19:20 20:20},
                        location: :kamaole_beach_3
                    }),
        BusStop.new({
                        times: %w{6:22 7:22 8:22 9:22 10:22 11:22 12:22 13:22 14:22 15:22 16:22 17:22 18:22 19:22 20:22},
                        location: :mana_kai_resort_south
                    }),
        BusStop.new({
                        times: %w{6:23 7:23 8:23 9:23 10:23 11:23 12:23 13:23 14:23 15:23 16:23 17:23 18:23 19:23 20:23},
                        location: :kilohana_south_kihei
                    }),
        BusStop.new({
                        times: %w{6:27 7:27 8:27 9:27 10:27 11:27 12:27 13:27 14:27 15:27 16:27 17:27 18:27 19:27 20:27},
                        location: :wailea_ike,
                        destination: true
                    }),
        BusStop.new({
                        times: %w{6:31 7:31 8:31 9:31 10:31 11:31 12:31 13:31 14:31 15:31 16:31 17:31 18:31 19:31 20:31},
                        location: :okolani_wailea
                    }),
        BusStop.new({
                        times: %w{6:33 7:33 8:33 9:33 10:33 11:33 12:33 13:33 14:33 15:33 16:33 17:33 18:33 19:33 20:33},
                        location: :mana_kai_resort_south
                    }),
        BusStop.new({
                        times: %w{6:34 7:34 8:34 9:34 10:34 11:34 12:34 13:34 14:34 15:34 16:34 17:34 18:34 19:34 20:34},
                        location: :kamaole_beach_3
                    }),
        BusStop.new({
                        times: %w{6:36 7:36 8:36 9:36 10:36 11:36 12:36 13:36 14:36 15:36 16:36 17:36 18:36 19:36 20:36},
                        location: :kamaole_shopping_center
                    }),
        BusStop.new({
                        times: %w{6:37 7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37},
                        location: :kamaole_beach_1
                    }),
        BusStop.new({
                        times: %w{6:39 7:39 8:39 9:39 10:39 11:39 12:39 13:39 14:39 15:39 16:39 17:39 18:39 19:39 20:39},
                        location: :walaka_south_kihei
                    }),
        BusStop.new({
                        name: 'Keala Pl. / S. Kihei Rd. Near Foodland',
                        times: %w{6:42 7:42 8:42 9:42 10:42 11:42 12:42 13:42 14:42 15:42 16:42 17:42 18:42 19:42 20:42},
                        location: :keala_place_south_kihei_mauka
                    }),
        BusStop.new({
                        name: 'Welakahao Rd. / S. Kihei Rd.',
                        times: %w{6:44 7:44 8:44 9:44 10:44 11:44 12:44 13:44 14:44 15:44 16:44 17:44 18:44 19:44 20:44},
                        location: :welakahao_south_kihei_mauka
                    }),
        BusStop.new({
                        name: 'Lipoa St.',
                        times: %w{6:46 7:46 8:46 9:46 10:46 11:46 12:46 13:46 14:46 15:46 16:46 17:46 18:46 19:46 20:46},
                        location: :lipoa_street
                    }),
        BusStop.new({
                        name: 'Piilani Shopping Center',
                        times: %w{6:50 7:50 8:50 9:50 10:50 11:50 12:50 13:50 14:50 15:50 16:50 17:50 18:50 19:50 20:50},
                        location: :piilani_shopping_center
                    }),
        BusStop.new({
                        name: 'Waipuilani Rd. / S. Kihei Rd.',
                        times: %w{6:56 7:56 8:56 9:56 10:56 11:56 12:56 13:56 14:56 15:56 16:56 17:56 18:56 19:56 20:56},
                        location: :waipuilani_south_kihei
                    }),
        BusStop.new({
                        name: 'Kaonoulu / S. Kihei Rd.',
                        times: %w{6:58 7:58 8:58 9:58 10:58 11:58 12:58 13:58 14:58 15:58 16:58 17:58 18:58 19:58 20:58},
                        location: :kaonoulu_south_kihei
                    }),
        BusStop.new({
                        name: 'Kulanihakoi St. / S. Kihei Rd.',
                        times: %w{6:57 7:57 8:57 9:57 10:57 11:57 12:57 13:57 14:57 15:57 16:57 17:57 18:57 19:57 20:57},
                        location: :kulanihakoi_south_kihei
                    }),
        BusStop.new({
                        times: %w{7:02 8:02 9:02 10:02 11:02 12:02 13:02 14:02 15:02 16:02 17:02 18:02 19:02 20:02 21:02},
                        location: :uwapo_south_kihei_mauka
                    }),
        BusStop.new({
                        name: 'Salvation Army',
                        times: %w{7:18 8:18 9:18 10:18 11:18 12:18 13:18 14:18 15:18 16:18 17:18 18:18 19:18 20:18 21:18},
                        location: :kahului_salvation_army_across
                    })
    ]

    def initialize(name='Kihei Islander Route #10')
      super(name, 120)
    end
  end

  class Villager < BasicRoute
    STOPS = [
        BusStop.new({
                        name: 'Maalaea Harbor Village',
                        times: %w{6:05 7:05 8:05 9:05 10:05 11:05 12:05 13:05 14:05 15:05 16:05 17:05 18:05 19:05 20:05},
                        location: :maalaea_harbor
                    }),
        BusStop.new({
                        name: 'Uwapo Rd. / S. Kihei Rd.',
                        times: %w{6:17 7:17 8:17 9:17 10:17 11:17 12:17 13:17 14:17 15:17 16:17 17:17 18:17 19:17 20:17},
                        location: :uwapo_south_kihei
                    }),
        BusStop.new({
                        name: 'Ohukai St. / S. Kihei Rd.',
                        times: %w{6:19 7:19 8:19 9:19 10:19 11:19 12:19 13:19 14:19 15:19 16:19 17:19 18:19 19:19 20:19},
                        location: :ohukai_south_kihei
                    }),
        BusStop.new({
                        name: 'Kaonoulu / S. Kihei Rd.',
                        times: %w{6:21 7:21 8:21 9:21 10:21 11:21 12:21 13:21 14:21 15:21 16:21 17:21 18:21 19:21 20:21},
                        location: :kaonoulu_south_kihei_makai
                    }),
        BusStop.new({
                        name: 'Kulanihakoi / S. Kihei Rd.',
                        times: %w{6:22 7:22 8:22 9:22 10:22 11:22 12:22 13:22 14:22 15:22 16:22 17:22 18:22 19:22 20:22},
                        location: :kulanihakoi_south_kihei
                    }),
        BusStop.new({
                        name: 'Waipuilani Rd. / S. Kihei Rd.',
                        times: %w{6:24 7:24 8:24 9:24 10:24 11:24 12:24 13:24 14:24 15:24 16:24 17:24 18:24 19:24 20:24},
                        location: :waipuilani_south_kihei_makai
                    }),
        BusStop.new({
                        name: 'Piikea Ave. / S. Kihei Rd.',
                        times: %w{6:26 7:26 8:26 9:26 10:26 11:26 12:26 13:26 14:26 15:26 16:26 17:26 18:26 19:26 20:26},
                        location: :piikea_south_kihei_across
                    }),
        BusStop.new({
                        name: 'Piilani Shopping Center',
                        times: %w{5:30 6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30},
                        location: :piilani_shopping_center,
                        destination: true
                    }),
        BusStop.new({
                        name: 'Piikea Ave. / S. Kihei Rd.',
                        times: %w{5:33 6:33 7:33 8:33 9:33 10:33 11:33 12:33 13:33 14:33 15:33 16:33 17:33 18:33 19:33 20:33},
                        location: :piikea_south_kihei
                    }),
        BusStop.new({
                        name: 'Waipuilani Rd. / S. Kihei Rd.',
                        times: %w{5:35 6:35 7:35 8:35 9:35 10:35 11:35 12:35 13:35 14:35 15:35 16:35 17:35 18:35 19:35 20:35},
                        location: :waipuilani_south_kihei
                    }),
        BusStop.new({
                        name: 'Kulanihakoi / S. Kihei Rd.',
                        times: %w{5:36 6:36 7:36 8:36 9:36 10:36 11:36 12:36 13:36 14:36 15:36 16:36 17:36 18:36 19:36 20:36},
                        location: :kulanihakoi_south_kihei
                    }),
        BusStop.new({
                        name: 'Kaonoulu / S. Kihei Rd.',
                        times: %w{5:37 6:37 7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37},
                        location: :kaonoulu_south_kihei
                    }),
        BusStop.new({
                        name: 'Ohukai St. / S. Kihei Rd.',
                        times: %w{5:39 6:39 7:39 8:39 9:39 10:39 11:39 12:39 13:39 14:39 15:39 16:39 17:39 18:39 19:39 20:39},
                        location: :ohukai_south_kihei
                    }),
        BusStop.new({
                        name: 'Uwapo Rd. / S. Kihei Rd.',
                        times: %w{5:41 6:41 7:41 8:41 9:41 10:41 11:41 12:41 13:41 14:41 15:41 16:41 17:41 18:41 19:41 20:41},
                        location: :uwapo_south_kihei_mauka
                    }),
        BusStop.new({
                        name: 'Maalaea Harbor Village',
                        times: %w{5:55 6:55 7:55 8:55 9:55 10:55 11:55 12:55 13:55 14:55 15:55 16:55 17:55 18:55 19:55 20:55},
                        location: :maalaea_harbor
                    })
    ]

    def initialize(name='Kihei Villager Route #15')
      super
    end
  end

end