class Wailuku < Region

  attr_reader :loop_one, :loop_two

  def initialize
    @loop_one = LoopOne.new
    @loop_two = LoopTwo.new
    super
  end

  class LoopOne < BasicLoop
    STOPS = [
        {
            name: 'Queen Kaahumanu Center',
            times: %w{6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30}
        },
        {
            name: 'Maui Memorial Hospital',
            times: %w{6:37 7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37}
        },
        {
            name: 'Maui Lani Parkway',
            times: %w{6:39 7:39 8:39 9:39 10:39 11:39 12:39 13:39 14:39 15:39 16:39 17:39 18:39 19:39 20:39}
        },
        {
            name: 'Ka Hale A Ke Ola',
            times: %w{6:47 7:47 8:47 9:47 10:47 11:47 12:47 13:47 14:47 15:47 16:47 17:47 18:47 19:47 20:47}
        },
        {
            name: 'State Office Building',
            times: %w{6:52 7:52 8:52 9:52 10:52 11:52 12:52 13:52 14:52 15:52 16:52 17:52 18:52 19:52 20:52}
        },
        {
            name: 'Malama I Ke Ola Health Clinic',
            times: %w{6:55 7:55 8:55 9:55 10:55 11:55 12:55 13:55 14:55 15:55 16:55 17:55 18:55 19:55 20:55}
        },
        {
            name: 'Wailuku Post Office',
            times: %w{6:58 7:58 8:58 9:58 10:58 11:58 12:58 13:58 14:58 15:58 16:58 17:58 18:58 19:58 20:58}
        },
        {
            name: 'Piihana Terrace',
            times: %w{7:03 8:03 9:03 10:03 11:03 12:03 13:03 14:03 15:03 16:03 17:03 18:03 19:03 20:03 21:03}
        },
        {
            name: 'Makaala Dr. Fronting Hale Mahaolu',
            times: %w{7:08 8:08 9:08 10:08 11:08 12:08 13:08 14:08 15:08 16:08 17:08 18:08 19:08 20:08 21:08}
        },
        {
            name: 'Waiehu Heights',
            times: %w{7:11 8:11 9:11 10:11 11:11 12:11 13:11 14:11 15:11 16:11 17:11 18:11 19:11 20:11 21:11}
        },
        {
            name: 'Hawaiian Homes',
            times: %w{7:12 8:12 9:12 10:12 11:12 12:12 13:12 14:12 15:12 16:12 17:12 18:12 19:12 20:12 21:12}
        },
        {
            name: 'Eha St. Fronting Sack N Save',
            times: %w{7:13 8:13 9:13 10:13 11:13 12:13 13:13 14:13 15:13 16:13 17:13 18:13 19:13 20:13 21:13}
        },
        {
            name: 'Wailuku Community Center',
            times: %w{7:15 8:15 9:15 10:15 11:15 12:15 13:15 14:15 15:15 16:15 17:15 18:15 19:15 20:15 21:15}
        },
        {
            name: 'Kanaloa Ave. / Little League Field',
            times: %w{7:21 8:21 9:21 10:21 11:21 12:21 13:21 14:21 15:21 16:21 17:21 18:21 19:21 20:21 21:21}
        }
    ]

    def initialize(name='Wailuku Loop Route #1')
      super(name, 60) # loop offset
    end
  end

  class LoopTwo < BasicLoop
    STOPS = [
        {
            name: 'Queen Kaahumanu Center',
            times: %w{7:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00}
        },
        {
            name: 'Kanaloa Ave. / Near Kaahumanu Ave.',
            times: %w{7:03 8:03 9:03 10:03 11:03 12:03 13:03 14:03 15:03 16:03 17:03 18:03 19:03 20:03 21:03}
        },
        {
            name: 'Wailuku Community Center',
            times: %w{7:08 8:08 9:08 10:08 11:08 12:08 13:08 14:08 15:08 16:08 17:08 18:08 19:08 20:08 21:08}
        },
        {
            name: 'Eha St. Fronting Sack N Save',
            times: %w{7:11 8:11 9:11 10:11 11:11 12:11 13:11 14:11 15:11 16:11 17:11 18:11 19:11 20:11 21:11}
        },
        {
            name: 'Hawaiian Homes',
            times: %w{7:15 8:15 9:15 10:15 11:15 12:15 13:15 14:15 15:15 16:15 17:15 18:15 19:15 20:15 21:15}
        },
        {
            name: 'Waiehu Heights',
            times: %w{7:17 8:17 9:17 10:17 11:17 12:17 13:17 14:17 15:17 16:17 17:17 18:17 19:17 20:17 21:17}
        },
        {
            name: 'Makaala Dr. Fronting Hale Mahaolu',
            times: %w{7:19 8:19 9:19 10:19 11:19 12:19 13:19 14:19 15:19 16:19 17:19 18:19 19:19 20:19 21:19}
        },
        {
            name: 'Piihana Terrace',
            times: %w{7:24 8:24 9:24 10:24 11:24 12:24 13:24 14:24 15:24 16:24 17:24 18:24 19:24 20:24 21:24}
        },
        {
            name: 'Wailuku Post Office',
            times: %w{7:29 8:29 9:29 10:29 11:29 12:29 13:29 14:29 15:29 16:29 17:29 18:29 19:29 20:29 21:29}
        },
        {
            name: 'Malama I Ke Ola Health Clinic',
            times: %w{7:32 8:32 9:32 10:32 11:32 12:32 13:32 14:32 15:32 16:32 17:32 18:32 19:32 20:32 21:32}
        },
        {
            name: 'Ka Hale A Ke Ola',
            times: %w{7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37 21:37}
        },
        {
            name: 'State Office Building',
            times: %w{7:43 8:43 9:43 10:43 11:43 12:43 13:43 14:43 15:43 16:43 17:43 18:43 19:43 20:43 21:43}
        },
        {
            name: 'Maui Lani Parkway',
            times: %w{7:46 8:46 9:46 10:46 11:46 12:46 13:46 14:46 15:46 16:46 17:46 18:46 19:46 20:46 21:46}
        },
        {
            name: 'Maui Memorial Hospital',
            times: %w{7:49 8:49 9:49 10:49 11:49 12:49 13:49 14:49 15:49 16:49 17:49 18:49 19:49 20:49 21:49}
        }
    ]

    def initialize(name='Wailuku Loop Route #2 (reverse)')
      super(name, 60) # loop offset
    end
  end

end
