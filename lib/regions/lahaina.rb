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
        {
            name: 'Queen Kaahumanu Center',
            times: %w{5:30 6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30}
        }, {
            name: 'State Office Building and Wells St.',
            times: %w{5:40 6:40 7:40 8:40 9:40 10:40 11:40 12:40 13:40 14:40 15:40 16:40 17:40 18:40 19:40}
        }, {
            name: 'Maalaea Harbor Village',
            times: %w{5:55 6:55 7:55 8:55 9:55 10:55 11:55 12:55 13:55 14:55 15:55 16:55 17:55 18:55 19:55}
        }, {
            name: 'Wharf Cinema Center',
            times: %w{6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30}
        }, {
            name: 'Maalaea Harbor Village',
            times: %w{7:05 8:05 9:05 10:05 11:05 12:05 13:05 14:05 15:05 16:05 17:05 18:05 19:05 20:05 21:05}
        }, {
            name: 'State Office Building',
            times: %w{7:18 8:18 9:18 10:18 11:18 12:18 13:18 14:18 15:18 16:18 17:18 18:18 19:18 20:18 21:18}
        }
    ]

    def initialize(name='Lahaina Islander #20')
      super(name, 120) # loop offset
    end
  end

  class Villager < BasicLoop
    STOPS = [
        {
            name: 'Wharf Cinema Center Luakini Street',
            times: %w{8:00 9:00 10:00 11:00 12:00 13:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00 22:00}
        }, {
            name: '505 Front Street',
            times: %w{8:04 9:04 10:04 11:04 12:04 13:04 15:04 16:04 17:04 18:04 19:04 20:04 21:04 22:04}
        }, {
            name: 'Lahaina Aquatics Center',
            times: %w{8:09 9:09 10:09 11:09 12:09 13:09 15:09 16:09 17:09 18:09 19:09 20:09 21:09 22:09}
        }, {
            name: 'Kuailua Street / Kumukahi Street',
            times: %w{8:15 9:15 10:15 11:15 12:15 13:15 15:15 16:15 17:15 18:15 19:15 20:15 21:15 22:15}
        }, {
            name: 'Kalena Street / Pikanele Street',
            times: %w{8:17 9:17 10:17 11:17 12:17 13:17 15:17 16:17 17:17 18:17 19:17 20:17 21:17 22:17}
        }, {
            name: 'Lahaina Gateway',
            times: %w{8:23 9:23 10:23 11:23 12:23 13:23 15:23 16:23 17:23 18:23 19:23 20:23 21:23 22:23}
        }, {
            name: 'Ainakea Road / Fleming Road',
            times: %w{8:27 9:27 10:27 11:27 12:27 13:27 15:27 16:27 17:27 18:27 19:27 20:27 21:27 22:27}
        }, {
            name: 'Leialii Parkway / Near Hooli Street',
            times: %w{8:31 9:31 10:31 11:31 12:31 13:31 15:31 16:31 17:31 18:31 19:31 20:31 21:31 22:31}
        }, {
            name: 'Lahaina Civic Center (back)',
            times: %w{8:34 9:34 10:34 11:34 12:34 13:34 15:34 16:34 17:34 18:34 19:34 20:34 21:34 22:34}
        }, {
            name: 'Lahaina Cannery Mall',
            times: %w{8:42 9:42 10:42 11:42 12:42 13:42 15:42 16:42 17:42 18:42 19:42 20:42 21:42 22:42}
        }, {
            name: 'Papalaua Street',
            times: %w{8:48 9:48 10:48 11:48 12:48 13:48 15:48 16:48 17:48 18:48 19:48 20:48 21:48 22:48}
        }
    ]

    def initialize(name='Lahaina Villager #23')
      super(name, 60)
    end
  end

end