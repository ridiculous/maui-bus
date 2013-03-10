class Kahului < Region
  attr_reader :loop_five, :loop_six

  def initialize
    @loop_five = LoopFive.new
    @loop_six = LoopSix.new
    super
  end

  class LoopFive < BasicRoute
    STOPS = [
        {
            name: 'Queen Kaahumanu Center',
            times: %w{6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30}
        },
        {
            name: 'Harbor Lights / UH Maui College',
            times: %w{6:38 7:38 8:38 9:38 10:38 11:38 12:38 13:38 14:38 15:38 16:38 17:38 18:38 19:38 20:38}
        },
        {
            name: 'Roselani Place',
            times: %w{6:41 7:41 8:41 9:41 10:41 11:41 12:41 13:41 14:41 15:41 16:41 17:41 18:41 19:41 20:41}
        },
        {
            name: 'Onehee Ave. / S. Papa Ave.',
            times: %w{6:44 7:44 8:44 9:44 10:44 11:44 12:44 13:44 14:44 15:44 16:44 17:44 18:44 19:44 20:44}
        },
        {
            name: 'Hale Mahaolu Elua',
            times: %w{6:47 7:47 8:47 9:47 10:47 11:47 12:47 13:47 14:47 15:47 16:47 17:47 18:47 19:47 20:47}
        },
        {
            name: 'Kamehameha Ave. / Molokai Akau St.',
            times: %w{6:49 7:49 8:49 9:49 10:49 11:49 12:49 13:49 14:49 15:49 16:49 17:49 18:49 19:49 20:49}
        },
        {
            name: 'Luana Gardens',
            times: %w{6:51 7:51 8:51 9:51 10:51 11:51 12:51 13:51 14:51 15:51 16:51 17:51 18:51 19:51 20:51}
        },
        {
            name: 'W. Papa Ave. / Laau St.',
            times: %w{6:53 7:53 8:53 9:53 10:53 11:53 12:53 13:53 14:53 15:53 16:53 17:53 18:53 19:53 20:53}
        },
        {
            name: 'Pakaula St. / Wal-Mart back Entrance',
            times: %w{7:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00}
        },
        {
            name: 'Maui Marketplace Food Court',
            times: %w{7:03 8:03 9:03 10:03 03:03 12:03 13:03 14:03 15:03 16:03 17:03 18:03 19:03 20:03 21:03}
        },
        {
            name: 'K-Mart',
            times: %w{7:08 8:08 9:08 10:08 11:08 12:08 13:08 14:08 15:08 16:08 17:08 18:08 19:08 20:08 21:08}
        },
        {
            name: 'Kamehameha Ave. / Maui Mall Entrance',
            times: %w{7:14 8:14 9:14 10:14 11:14 12:14 13:14 14:14 15:14 16:14 17:14 18:14 19:14 20:14}
        },
        {
            name: 'Kahului Shopping Center',
            times: %w{7:17 8:17 9:17 10:17 11:17 12:17 13:17 14:17 15:17 16:17 17:17 18:17 19:17 20:17}
        },
        {
            name: 'Queen Kaahumanu Center',
            times: %w{7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30}
        }
    ]

    def initialize(name='Kahului Loop Route #5')
      super
    end
  end

  # reverse
  class LoopSix < BasicRoute
    STOPS = [
        {
            name: 'Queen Kaahumanu Center',
            times: %w{7:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00}
        },
        {
            name: 'Kahului Shopping Center',
            times: %w{7:08 8:08 9:08 10:08 11:08 12:08 13:08 14:08 15:08 16:08 17:08 18:08 19:08 20:08 21:08}
        },
        {
            name: 'Kamehameha Ave. / Hoohana St.',
            times: %w{7:10 8:10 9:10 10:10 11:10 12:10 13:10 14:10 15:10 16:10 17:10 18:10 19:10 20:10 21:10}
        },
        {
            name: 'K-Mart',
            times: %w{7:16 8:16 9:16 10:16 11:16 12:16 13:16 14:16 15:16 16:16 17:16 18:16 19:16 20:16 21:16}
        },
        {
            name: 'Maui Marketplace Food Court',
            times: %w{7:25 8:25 9:25 10:25 11:25 12:25 13:25 14:25 15:25 16:25 17:25 18:25 19:25 20:25 21:25}
        },
        {
            name: 'Pakaula St. Past Home Depot Entrance / Molokai Akau St.',
            times: %w{7:29 8:29 9:29 10:29 11:29 12:29 13:29 14:29 15:29 16:29 17:29 18:29 19:29 20:29 21:29}
        },
        {
            name: 'West Papa Ave. Laau St.',
            times: %w{7:35 8:35 9:35 10:35 11:35 12:35 13:35 14:35 15:35 16:35 17:35 18:35 19:35 20:35 21:35}
        },
        {
            name: 'Luana Gardens',
            times: %w{7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37 21:37}
        },
        {
            name: 'Kamehameha Ave. / Molokai Akua St.',
            times: %w{7:38 8:38 9:38 10:38 11:38 12:38 13:38 14:38 15:38 16:38 17:38 18:38 19:38 20:38 21:38}
        },
        {
            name: 'Hale Mahaolu Elua',
            times: %w{7:40 8:40 9:40 10:40 40:40 12:40 13:40 14:40 15:40 16:40 17:40 18:40 19:40 20:40 21:40}
        },
        {
            name: 'Onehee / S. Papa Ave.',
            times: %w{7:43 8:43 9:43 10:43 11:43 12:43 13:43 14:43 15:43 16:43 17:43 18:43 19:43 20:43 21:43}
        },
        {
            name: 'Roselane Place',
            times: %w{7:45 8:45 9:45 10:45 11:45 12:45 13:45 14:45 15:45 16:45 17:45 18:45 19:45 20:45 21:45}
        },
        {
            name: 'Harbor Lights / UH Maui College',
            times: %w{7:48 8:48 9:48 10:48 11:48 12:48 13:48 14:48 15:48 16:48 17:48 18:48 19:48 20:48 21:48}
        },
        {
            name: 'Queen Kaahumanu Center',
            times: %w{8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00 22:00}
        }
    ]

    def initialize(name='Kahului Loop Route #6 (reverse)')
      super
    end
  end

end