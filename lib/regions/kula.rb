class Kula < Region
  attr_reader :villager

  def initialize
    @villager = Villager.new
    super
  end

  class Villager < BasicLoop
    STOPS = [
        {
            name: 'Pukalani Terrace in front Bank of Hawaii',
            times: %w{7:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00}
        }, {
            name: 'Kula Hwy Fronting Longs Kulamalu - To Kula',
            times: %w{7:10 8:10 9:10 10:10 11:10 12:10 13:10 14:10 15:10 16:10 17:10 18:10 19:10 20:10}
        }, {
            name: 'Lower Kula Rd. / Waimele Place',
            times: %w{7:15 8:15 9:15 10:15 11:15 12:15 13:15 14:15 15:15 16:15 17:15 18:15 19:15 20:15}
        }, {
            name: 'Lower Kula Rd. / Lower Kimo Dr.',
            times: %w{7:16 8:16 9:16 10:16 11:16 12:16 13:16 14:16 15:16 16:16 17:16 18:16 19:16 20:16}
        }, {
            name: 'Kula Hardware',
            times: %w{7:18 8:18 9:18 10:18 11:18 12:18 13:18 14:18 15:18 16:18 17:18 18:18 19:18 20:18}
        }, {
            name: 'Kula Community Center / Holy Ghost Church',
            times: %w{7:22 8:22 9:22 10:22 11:22 12:22 13:22 14:22 15:22 16:22 17:22 18:22 19:22 20:22}
        }, {
            name: 'Near Morihara Store / Kula Gym',
            times: %w{7:23 8:23 9:23 10:23 11:23 12:23 13:23 14:23 15:23 16:23 17:23 18:23 19:23 20:23}
        }, {
            name: 'Lower Kula Rd. / Naalae St.',
            times: %w{7:26 8:26 9:26 10:26 11:26 12:26 13:26 14:26 15:26 16:26 17:26 18:26 19:26 20:26}
        }, {
            name: 'Rice Park',
            times: %w{7:28 8:28 9:28 10:28 11:28 12:28 13:28 14:28 15:28 16:28 17:28 18:28 19:28 20:28}
        }, {
            name: 'Lower Kula Rd. / Naalae St.',
            times: %w{7:32 8:32 9:32 10:32 11:32 12:32 13:32 14:32 15:32 16:32 17:32 18:32 19:32 20:32}
        }, {
            name: 'Near Morihara Store / Kula Gym',
            times: %w{7:35 8:35 9:35 10:35 11:35 12:35 13:35 14:35 15:35 16:35 17:35 18:35 19:35 20:35}
        }, {
            name: 'Kula Community Center / Holy Ghost Church',
            times: %w{7:36 8:36 9:36 10:36 11:36 12:36 13:36 14:36 15:36 16:36 17:36 18:36 19:36 20:36}
        }, {
            name: 'Kula Hardware',
            times: %w{7:41 8:41 9:41 10:41 11:41 12:41 13:41 14:41 15:41 16:41 17:41 18:41 19:41 20:41}
        }, {
            name: 'Lower Kula Rd. / Lower Kimo Dr.',
            times: %w{7:43 8:43 9:43 10:43 11:43 12:43 13:43 14:43 15:43 16:43 17:43 18:43 19:43 20:43}
        }, {
            name: 'Lower Kula Rd. / Waimele Place',
            times: %w{7:44 8:44 9:44 10:44 11:44 12:44 13:44 14:44 15:44 16:44 17:44 18:44 19:44 20:44}
        }, {
            name: 'Kula Hwy Fronting Longs Kulamalu - To Kula',
            times: %w{7:50 8:50 9:50 10:50 11:50 12:50 13:50 14:50 15:50 16:50 17:50 18:50 19:50 20:50}
        }
    ]

    def initialize(name='Kula Villager Route #39')
      super(name, 60)
    end
  end
end