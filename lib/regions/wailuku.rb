class Wailuku < Region

  attr_reader :loop_one, :loop_two

  def initialize
    @loop_one = Loop1.new
    @loop_two = Loop2.new
    super
  end

  class Loop1 < BasicLoop
    STOPS = [
        BusStop.new({
                        times: %w{6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30 20:30},
                        location: :queen_kaahumanu
                    }),
        BusStop.new({
                        times: %w{6:37 7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37},
                        location: :maui_memorial_hospital
                    }),
        BusStop.new({
                        times: %w{6:39 7:39 8:39 9:39 10:39 11:39 12:39 13:39 14:39 15:39 16:39 17:39 18:39 19:39 20:39},
                        location: :maui_lani_parkway
                    }),
        BusStop.new({
                        times: %w{6:46 7:46 8:46 9:46 10:46 11:46 12:46 13:46 14:46 15:46 16:46 17:46 18:46 19:46 20:46},
                        location: :kamole_st_kehalani_sub
                    }),
        BusStop.new({
                        times: %w{6:47 7:47 8:47 9:47 10:47 11:47 12:47 13:47 14:47 15:47 16:47 17:47 18:47 19:47 20:47},
                        location: :ka_hale_ake_ola
                    }),
        BusStop.new({
                        times: %w{6:52 7:52 8:52 9:52 10:52 11:52 12:52 13:52 14:52 15:52 16:52 17:52 18:52 19:52 20:52},
                        location: :state_bldg
                    }),
        BusStop.new({
                        times: %w{6:55 7:55 8:55 9:55 10:55 11:55 12:55 13:55 14:55 15:55 16:55 17:55 18:55 19:55 20:55},
                        location: :ke_ola_health_clinic
                    }),
        BusStop.new({
                        times: %w{6:58 7:58 8:58 9:58 10:58 11:58 12:58 13:58 14:58 15:58 16:58 17:58 18:58 19:58 20:58},
                        location: :wailuku_post_office
                    }),
        BusStop.new({
                        times: %w{7:02 8:02 9:02 10:02 11:02 12:02 13:02 14:02 15:02 16:02 17:02 18:02 19:02 20:02 21:02},
                        location: :kahekili_terrace
                    }),
        BusStop.new({
                        times: %w{7:03 8:03 9:03 10:03 11:03 12:03 13:03 14:03 15:03 16:03 17:03 18:03 19:03 20:03 21:03},
                        location: :piihana_terrace
                    }),
        BusStop.new({
                        times: %w{7:05 8:05 9:05 10:05 11:05 12:05 13:05 14:05 15:05 16:05 17:05 18:05 19:05 20:05 21:05},
                        location: :makaala_makamua_st
                    }),
        BusStop.new({
                        times: %w{7:06 8:06 9:06 10:06 11:06 12:06 13:06 14:06 15:06 16:06 17:06 18:06 19:06 20:06 21:06},
                        location: :makaala_alihilani_st
                    }),
        BusStop.new({
                        times: %w{7:07 8:07 9:07 10:07 11:07 12:07 13:07 14:07 15:07 16:07 17:07 18:07 19:07 20:07 21:07},
                        location: :makaala_kilihau_st_across
                    }),
        BusStop.new({
                        times: %w{7:08 8:08 9:08 10:08 11:08 12:08 13:08 14:08 15:08 16:08 17:08 18:08 19:08 20:08 21:08},
                        location: :makaala_hale_mahaolu
                    }),
        BusStop.new({
                        times: %w{7:10 8:10 9:10 10:10 11:10 12:10 13:10 14:10 15:10 16:10 17:10 18:10 19:10 20:10 21:10},
                        location: :waiehu_heights_aukai
                    }),
        BusStop.new({
                        times: %w{7:11 8:11 9:11 10:11 11:11 12:11 13:11 14:11 15:11 16:11 17:11 18:11 19:11 20:11 21:11},
                        location: :waiehu_heights_wailupe
                    }),
        BusStop.new({
                        times: %w{7:12 8:12 9:12 10:12 11:12 12:12 13:12 14:12 15:12 16:12 17:12 18:12 19:12 20:12 21:12},
                        location: :hawaiian_homes
                    }),
        BusStop.new({
                        times: %w{7:13 8:13 9:13 10:13 11:13 12:13 13:13 14:13 15:13 16:13 17:13 18:13 19:13 20:13 21:13},
                        location: :eha_st_sack_n_save
                    }),
        BusStop.new({
                        name: 'Wailuku Community Center',
                        times: %w{7:15 8:15 9:15 10:15 11:15 12:15 13:15 14:15 15:15 16:15 17:15 18:15 19:15 20:15 21:15},
                        location: :wailuku_community_center
                    }),
        BusStop.new({
                        times: %w{7:20 8:20 9:20 10:20 11:20 12:20 13:20 14:20 15:20 16:20 17:20 18:20 19:20 20:20 21:20},
                        location: :liholiho_kanaloa_ave
                    }),
        BusStop.new({
                        times: %w{7:21 8:21 9:21 10:21 11:21 12:21 13:21 14:21 15:21 16:21 17:21 18:21 19:21 20:21 21:21},
                        location: :lihi_kanaloa_ave
                    }),
        BusStop.new({
                        times: %w{7:22 8:22 9:22 10:22 11:22 12:22 13:22 14:22 15:22 16:22 17:22 18:22 19:22 20:22 21:22},
                        location: :kanaloa_baseball_field
                    })
    ]

    def initialize(name='Wailuku Loop Route #1')
      super(name, 60) # loop offset
    end
  end

  class Loop2 < BasicLoop
    STOPS = [
        BusStop.new({
                        times: %w{7:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00},
                        location: :queen_kaahumanu
                    }),
        BusStop.new({
                        times: %w{7:03 8:03 9:03 10:03 11:03 12:03 13:03 14:03 15:03 16:03 17:03 18:03 19:03 20:03 21:03},
                        location: :kanaloa_baseball_field
                    }),
        BusStop.new({
                        times: %w{7:04 8:04 9:04 10:04 11:04 12:04 13:04 14:04 15:04 16:04 17:04 18:04 19:04 20:04 21:04},
                        location: :wailuku_ymca
                    }),
        BusStop.new({
                        times: %w{7:06 8:06 9:06 10:06 11:06 12:06 13:06 14:06 15:06 16:06 17:06 18:06 19:06 20:06 21:06},
                        location: :lihi_kanaloa_ave_parkside
                    }),
        BusStop.new({
                        times: %w{7:07 8:07 9:07 10:07 11:07 12:07 13:07 14:07 15:07 16:07 17:07 18:07 19:07 20:07 21:07},
                        location: :liholiho_kanaloa_ave_parkside
                    }),
        BusStop.new({
                        name: 'Wailuku Community Center',
                        times: %w{7:08 8:08 9:08 10:08 11:08 12:08 13:08 14:08 15:08 16:08 17:08 18:08 19:08 20:08 21:08},
                        location: :wailuku_community_center_across
                    }),
        BusStop.new({
                        times: %w{7:11 8:11 9:11 10:11 11:11 12:11 13:11 14:11 15:11 16:11 17:11 18:11 19:11 20:11 21:11},
                        location: :eha_st_sack_n_save
                    }),
        BusStop.new({
                        times: %w{7:15 8:15 9:15 10:15 11:15 12:15 13:15 14:15 15:15 16:15 17:15 18:15 19:15 20:15 21:15},
                        location: :hawaiian_homes_makai
                    }),
        BusStop.new({
                        times: %w{7:16 8:16 9:16 10:16 11:16 12:16 13:16 14:16 15:16 16:16 17:16 18:16 19:16 20:16 21:16},
                        location: :waiehu_heights_aukai
                    }),
        BusStop.new({
                        times: %w{7:17 8:17 9:17 10:17 11:17 12:17 13:17 14:17 15:17 16:17 17:17 18:17 19:17 20:17 21:17},
                        location: :waiehu_heights_wailupe
                    }),
        BusStop.new({
                        times: %w{7:19 8:19 9:19 10:19 11:19 12:19 13:19 14:19 15:19 16:19 17:19 18:19 19:19 20:19 21:19},
                        location: :makaala_hale_mahaolu
                    }),
        BusStop.new({
                        times: %w{7:20 8:20 9:20 10:20 11:20 12:20 13:20 14:20 15:20 16:20 17:20 18:20 19:20 20:20 21:20},
                        location: :makaala_kilihau_st
                    }),
        BusStop.new({
                        times: %w{7:22 8:22 9:22 10:22 11:22 12:22 13:22 14:22 15:22 16:22 17:22 18:22 19:22 20:22 21:22},
                        location: :makaala_kuhio_pl
                    }),
        BusStop.new({
                        times: %w{7:23 8:23 9:23 10:23 11:23 12:23 13:23 14:23 15:23 16:23 17:23 18:23 19:23 20:23 21:23},
                        location: :makaala_makamua_st_across
                    }),
        BusStop.new({
                        times: %w{7:24 8:24 9:24 10:24 11:24 12:24 13:24 14:24 15:24 16:24 17:24 18:24 19:24 20:24 21:24},
                        location: :piihana_terrace
                    }),
        BusStop.new({
                        times: %w{7:26 8:26 9:26 10:26 11:26 12:26 13:26 14:26 15:26 16:26 17:26 18:26 19:26 20:26 21:26},
                        location: :kahekili_terrace
                    }),
        BusStop.new({
                        times: %w{7:29 8:29 9:29 10:29 11:29 12:29 13:29 14:29 15:29 16:29 17:29 18:29 19:29 20:29 21:29},
                        location: :wailuku_post_office
                    }),
        BusStop.new({
                        times: %w{7:32 8:32 9:32 10:32 11:32 12:32 13:32 14:32 15:32 16:32 17:32 18:32 19:32 20:32 21:32},
                        location: :ke_ola_health_clinic
                    }),
        BusStop.new({
                        times: %w{7:35 8:35 9:35 10:35 11:35 12:35 13:35 14:35 15:35 16:35 17:35 18:35 19:35 20:35 21:35},
                        location: :kamole_st_kehalani_sub
                    }),
        BusStop.new({
                        times: %w{7:37 8:37 9:37 10:37 11:37 12:37 13:37 14:37 15:37 16:37 17:37 18:37 19:37 20:37 21:37},
                        location: :ka_hale_ake_ola
                    }),
        BusStop.new({
                        times: %w{7:43 8:43 9:43 10:43 11:43 12:43 13:43 14:43 15:43 16:43 17:43 18:43 19:43 20:43 21:43},
                        location: :state_bldg
                    }),
        BusStop.new({
                        times: %w{7:46 8:46 9:46 10:46 11:46 12:46 13:46 14:46 15:46 16:46 17:46 18:46 19:46 20:46 21:46},
                        location: :maui_lani_parkway
                    }),
        BusStop.new({
                        times: %w{7:49 8:49 9:49 10:49 11:49 12:49 13:49 14:49 15:49 16:49 17:49 18:49 19:49 20:49 21:49},
                        location: :maui_memorial_hospital_across
                    })
    ]

    def initialize(name='Wailuku Loop Route #2 (reverse)')
      super(name, 60) # loop offset
    end
  end

end
