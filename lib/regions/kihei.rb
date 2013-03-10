class Kihei < Region

  attr_reader :islander, :villager

  def initialize
    @islander = Islander.new
    @villager = Villager.new
    super
  end

  class Islander < BasicLoop
    STOPS = [
        {
            name: 'Queen Kaahumanu Center',
            times: %w{5:30 6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30}
        }, {
            name: 'Kahului Salvation Army',
            times: %w{5:35 6:35 7:35 8:35 9:35 10:35 11:35 12:35 13:35 14:35 15:35 16:35 17:35 18:35 19:35}
        }, {
            name: 'Uwapo / S. Kihei Rd.',
            times: %w{5:50 6:50 7:50 8:50 9:50 10:50 11:50 12:50 13:50 14:50 15:50 16:50 17:50 18:50 19:50}
        }, {
            name: 'Kulanihakoi St. / S. Kihei Rd.',
            times: %w{5:55 6:55 7:55 8:55 9:55 10:55 11:55 12:55 13:55 14:55 15:55 16:55 17:55 18:55 19:55}
        }, {
            name: 'Piilani Shopping Center',
            times: %w{6:03 7:03 8:03 9:03 10:03 11:03 12:03 13:03 14:03 15:03 16:03 17:03 18:03 19:03 20:03}
        }, {
            name: 'Keala Pl. / S. Kihei Rd. Kalama Park',
            times: %w{6:12 7:12 8:12 9:12 10:12 11:12 12:12 13:12 14:12 15:12 16:12 17:12 18:12 19:12 20:12}
        }, {
            name: 'Kamaole Beach III',
            times: %w{6:20 7:20 8:20 9:20 10:20 11:20 12:20 13:20 14:20 15:20 16:20 17:20 18:20 19:20 20:20}
        }, {
            name: 'Wailea Ike Drive',
            times: %w{6:27 7:27 8:27 9:27 10:27 11:27 12:27 13:27 14:27 15:27 16:27 17:27 18:27 19:27 20:27}
        }, {
            name: 'Kamaole Beach III',
            times: %w{6:34 7:34 8:34 9:34 10:34 11:34 12:34 13:34 14:34 15:34 16:34 17:34 18:34 19:34 20:34}
        }, {
            name: 'Keala Pl. / S. Kihei Rd. Near Foodland',
            times: %w{6:42 7:42 8:42 9:42 10:42 11:42 12:42 13:42 14:42 15:42 16:42 17:42 18:42 19:42 20:42}
        }, {
            name: 'Piilani Shopping Center',
            times: %w{6:50 7:50 8:50 9:50 10:50 11:50 12:50 13:50 14:50 15:50 16:50 17:50 18:50 19:50 20:50}
        }, {
            name: 'Kulanihakoi St. / S. Kihei Rd.',
            times: %w{6:57 7:57 8:57 9:57 10:57 11:57 12:57 13:57 14:57 15:57 16:57 17:57 18:57 19:57 20:57}
        }, {
            name: 'Uwapo / S. Kihei Rd.',
            times: %w{7:02 8:02 9:02 10:02 11:02 12:02 13:02 14:02 15:02 16:02 17:02 18:02 19:02 20:02 21:02}
        }, {
            name: 'Kahului Salvation Army',
            times: %w{7:18 8:18 9:18 10:18 11:18 12:18 13:18 14:18 15:18 16:18 17:18 18:18 19:18 20:18 21:18}
        }
    ]

    def initialize(name='Kihei Islander Route #10')
      super(name, 120)
    end
  end

  class Villager < BasicRoute
    STOPS = [
        {
            name: 'Maalaea Harbor Village',
            times: %w{6:05 7:05 8:05 9:05 10:05 11:05 12:05 13:05 14:05 15:05 16:05 17:05 18:05 19:05 20:05}
        }, {
            name: 'Uwapo Rd. / S. Kihei Rd.',
            times: %w{6:17 7:17 8:17 9:17 10:17 11:17 12:17 13:17 14:17 15:17 16:17 17:17 18:17 19:17 20:17}
        }, {
            name: 'Ohukai St. / S. Kihei Rd.',
            times: %w{6:19 7:19 8:19 9:19 10:19 11:19 12:19 13:19 14:19 15:19 16:19 17:19 18:19 19:19 20:19}
        }, {
            name: 'Kaonoulu / S. Kihei Rd.',
            times: %w{6:21 7:21 8:21 9:21 10:21 11:21 12:21 13:21 14:21 15:21 16:21 17:21 18:21 19:21 20:21}
        }, {
            name: 'Kulanihakoi / S. Kihei Rd.',
            times: %w{6:22 7:22 8:22 9:22 10:22 11:22 12:22 13:22 14:22 15:22 16:22 17:22 18:22 19:22 20:22}
        }, {
            name: 'Waipuilani Rd. / S. Kihei Rd.',
            times: %w{6:24 7:24 8:24 9:24 10:24 11:24 12:24 13:24 14:24 15:24 16:24 17:24 18:24 19:24 20:24}
        }, {
            name: 'Piikea Ave. / S. Kihei Rd.',
            times: %w{6:26 7:26 8:26 9:26 10:26 11:26 12:26 13:26 14:26 15:26 16:26 17:26 18:26 19:26 20:26}
        }, {
            name: 'Piilani Shopping Center',
            times: %w{5:30 6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30}
        }, {
            name: 'Piikea Ave. / S. Kihei Rd.',
            times: %w{5:33 6:33 7:33 8:33 9:33 10:33 11:33 12:33 13:33 14:33 15:33 16:33 17:33 18:33 19:33 20:33}
        }, {
            name: 'Waipuilani Rd. / S. Kihei Rd.',
            times: %w{5:35 6:35 7:35 8:35 9:35 10:35 11:35 12:35 13:35 14:35 15:35 16:35 17:35 18:35 19:35 20:35}
        }, {
            name: 'Kulanihakoi / S. Kihei Rd.',
            times: %w{5:36 6:36 7:36 8:36 9:36 10:36 11:36 12:36 13:36 14:36 15:36 16:36 17:36 18:36 19:36 20:36}
        }, {
            name: 'Kaonoulu / S. Kihei Rd.',
            times: %w{5:37 6:37 7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37}
        }, {
            name: 'Ohukai St. / S. Kihei Rd.',
            times: %w{5:39 6:39 7:39 8:39 9:39 10:39 11:39 12:39 13:39 14:39 15:39 16:39 17:39 18:39 19:39 20:39}
        }, {
            name: 'Uwapo Rd. / S. Kihei Rd.',
            times: %w{5:41 6:41 7:41 8:41 9:41 10:41 11:41 12:41 13:41 14:41 15:41 16:41 17:41 18:41 19:41 20:41}
        }, {
            name: 'Maalaea Harbor Village',
            times: %w{5:55 6:55 7:55 8:55 9:55 10:55 11:55 12:55 13:55 14:55 15:55 16:55 17:55 18:55 19:55 20:55}
        }
    ]

    def initialize(name='Kihei Villager Route #15')
      super
    end
  end

end