class Location

  ZIP_CODES = {
      96708 => 'Haiku',
      96732 => 'Kahului',
      96753 => 'Kihei',
      96790 => 'Kula',
      96761 => 'Lahaina',
      96768 => 'Makawao',
      96779 => 'Paia',
      96793 => 'Wailuku'
  }

  #  <# latitude, longitude, address, zip >
  LIST = {
      # Haiku
      haiku_community_center: Detail.new(20.929556, -156.321201, 'Haiku Community Center', 96708),
      haiku_marketplace: Detail.new(20.913502, -156.322564, 'Haiku Marketplace', 96708),

      # Kahului
      kahului_airport: Detail.new(20.8943, -156.4377, 'Airport Pick-up Zone #3', 96732),
      hale_mahaolu_elua: Detail.new(20.882385, -156.474543, 'Hale Mahaolu Elua', 96732),
      kahului_community_center: Detail.new(20.880508, -156.480251, 'Kahului Community Center', 96732),
      kahului_community_center_across: Detail.new(20.880546, -156.480339, 'Kahului Community Center', 96732),
      kahului_salvation_army: Detail.new(20.88789, -156.4676064, 'Salvation Army', 96732),
      kahului_salvation_army_across: Detail.new(20.888100, -156.467757, 'Salvation Army', 96732),
      kahului_safeway: Detail.new(20.889237, -156.464077, 'Kahului Safeway', 96732),
      kahului_safeway_across: Detail.new(20.889402, -156.464152, 'Safeway / Maui Mall Entrance', 96732),
      kahului_shopping_center: Detail.new(20.890359, -156.468675, 'Kahului Shopping Center', 96732),
      kanaloa_baseball_field: Detail.new(20.890099, -156.486951, 'Kanaloa Ave. / Little League Field', 96732),
      kamehameha_ave_molokai_akua_st: Detail.new(20.875762, -156.477534, 'Kamehameha Ave. / Molokai Akua St.', 96732),
      kamehameha_ave_molokai_akua_st_across: Detail.new(20.875742, -156.477432, 'Kamehameha Ave. / Molokai Akua St.', 96732),
      kamehameha_ave_laau_st_across: Detail.new(20.878802, -156.475310, 'Kamehameha Ave. / Laau St.', 96732),
      kamehameha_ave_laau_st: Detail.new(20.878832, -156.475393, 'Kamehameha Ave. / Laau St.', 96732),
      kmart: Detail.new(20.886029, -156.451567, 'K-Mart', 96732),
      luana_gardens: Detail.new(20.872717, -156.476686, 'Luana Gardens', 96732),
      luana_gardens_across: Detail.new(20.872830, -156.476673, 'Luana Gardens', 96732),
      maui_college: Detail.new(20.891191, -156.476710, 'Harbor Lights / UH Maui College', 96732),
      maui_market_place: Detail.new(20.879980, -156.455398, 'Maui Marketplace Food Court', 96732),
      onehee_papa_ave_across: Detail.new(20.877661, -156.482308, 'Onehee / S. Papa Ave.', 96732),
      onehee_papa_ave: Detail.new(20.877629, -156.482206, 'Onehee / S. Papa Ave.', 96732),
      papa_ave_kea_st: Detail.new(20.882790, -156.485657, 'Papa Ave. / Kea St.', 96732),
      papa_ave_kea_across: Detail.new(20.882741, -156.485586, 'Papa Ave. / Kea St.', 96732),
      queen_kaahumanu: Detail.new(20.886570, -156.475375, 'Queen Kaahumanu Mall', 96732, true),
      roselani_place: Detail.new(20.887098, -156.484196, 'Roselani Place', 96732),
      roselani_place_across: Detail.new(20.886721, -156.484360, 'Roselani Place', 96732),
      walmart_back: Detail.new(20.877052, -156.455591, 'Pakaula St. / Wal-Mart back Entrance', 96732),
      walmart_across: Detail.new(20.877014, -156.455652, 'Pakaula St. / Wal-Mart back Entrance', 96732),
      west_papa_lanai_st: Detail.new(20.879076, -156.463215, 'W. Papa Ave. / S Lanai St.', 96732),
      west_papa_lanai_st_across: Detail.new(20.878882, -156.463552, 'W. Papa Ave. / S Lanai St.', 96732),
      west_papa_laau_st_across: Detail.new(20.874649, -156.467512, 'W. Papa Ave. / Laau St.', 96732),
      west_papa_laau_st: Detail.new(20.874616, -156.467445, 'W. Papa Ave. / Laau St.', 96732),

      # Kihei
      maalaea_harbor: Detail.new(20.792111, -156.513081, 'Maalaea Harbor', 96753, true),
      uwapo_south_kihei: Detail.new(20.781604, -156.462809, 'Uwapo Rd. / S. Kihei Rd.', 96753),
      uwapo_south_kihei_mauka: Detail.new(20.781346, -156.462543, 'Uwapo Rd. / S. Kihei Rd.', 96753),
      ohukai_south_kihei: Detail.new(20.774610, -156.460244, 'Ohukai Rd. / S. Kihei Rd.', 96753),
      kaonoulu_south_kihei_makai: Detail.new(20.766397, -156.458482, 'Kaonoulu St. / S. Kihei Rd.', 96753),
      kaonoulu_south_kihei: Detail.new(20.765203, -156.458230, 'Kaonoulu St. / S. Kihei Rd.', 96753),
      kulanihakoi_south_kihei: Detail.new(20.761200, -156.457790, 'Kulanihakoi St. / S. Kihei Rd.', 96753),
      waipuilani_south_kihei: Detail.new(20.755096, -156.456610, 'Waipuilani Rd. / S. Kihei Rd.', 96753),
      waipuilani_south_kihei_makai: Detail.new(20.755813, -156.456884, 'Waipuilani Rd. / S. Kihei Rd.', 96753),
      piikea_south_kihei_across: Detail.new(20.750235, -156.455124, 'Piikea Ave. / S. Kihei Rd.', 96753),
      piikea_south_kihei: Detail.new(20.750390, -156.454879, 'Piikea Ave. / S. Kihei Rd.', 96753),
      piilani_shopping_center: Detail.new(20.751888, -156.448445, 'Piilani Shopping Center', 96753, true),
      lipoa_liloa: Detail.new(20.748173, -156.450178, 'E Lipoa St. / Liloa Dr.', 96753),
      lipoa_liloa_across: Detail.new(20.748032, -156.449851, 'E Lipoa St. / Liloa Dr.', 96753),
      st_theresas_church: Detail.new(20.747009, -156.455033, "St Theresa's Church", 96753),
      welakahao_south_kihei: Detail.new(20.739706, -156.454144, "Welakahao Rd. / S. Kihei Rd.", 96753),
      welakahao_south_kihei_mauka: Detail.new(20.740292, -156.454136, "Welakahao Rd. / S. Kihei Rd.", 96753),
      lipoa_street: Detail.new(20.747614, -156.454702, "Lipoa St.", 96753),
      keala_place_south_kihei: Detail.new(20.732112, -156.452235, "Keala Pl. / South Kihei", 96753),
      keala_place_south_kihei_mauka: Detail.new(20.732890, -156.452435, "Keala Pl. / South Kihei", 96753),
      walaka_south_kihei: Detail.new(20.726697, -156.448510, "Walaka St. / South Kihei", 96753),
      kamaole_beach_1: Detail.new(20.721211, -156.447162, "Kamaole Beach I", 96753),
      kamaole_shopping_center: Detail.new(20.718593, -156.446616, "Kamaole Shopping Center", 96753),
      kamaole_beach_3: Detail.new(20.712895, -156.445337, "Kamaole Beach III", 96753),
      mana_kai_resort_south: Detail.new(20.705098, -156.444966, 'Mana Kai Resort (South)', 96753),
      kilohana_south_kihei: Detail.new(20.702001, -156.444658, 'Kilohana Dr. / S. Kihei Rd.', 96753),
      okolani_wailea: Detail.new(20.698260, -156.442818, 'Okolani / Wailea Alanui Dr.', 96753),
      wailea_ike: Detail.new(20.686904, -156.437995, 'Wailea Ike Drive', 96753),

      # Kula
      waimele_place_kula: Detail.new(20.791424, -156.324731, 'Lower Kula Rd. / Waimele Place', 96790),
      lower_kimo_drive: Detail.new(20.787352, -156.325396, 'Lower Kula Rd. / Lower Kimo Dr.', 96790),
      kula_hardware: Detail.new(20.776915, -156.325844, 'Kula Hardware', 96790),
      kula_community_center: Detail.new(20.763643, -156.326635, 'Kula Community Center', 96790),
      kula_gym: Detail.new(20.759625, -156.327381, 'Kula Community Center', 96790),
      naalae_road: Detail.new(20.749447, -156.329543, 'Lower Kula Rd. / Naalae Rd.', 96790),
      rice_park: Detail.new(20.741641, -156.332327, 'Rice Park', 96790),

      # Lahaina
      wharf_cinema: Detail.new(20.872799, -156.676799, 'Wharf Cinema Center Luakini Street', 96761, true),
      papalaua_st: Detail.new(20.877316, -156.680821, 'Papalaua Street', 96761),
      lahaina_cannery_mall: Detail.new(20.886098, -156.683599, 'Lahaina Cannery Mall', 96761),
      lahaina_gateway: Detail.new(20.885035, -156.681439, 'Lahaina Gateway', 96761),
      ainakea_malolo_lahaina: Detail.new(20.890104, -156.682558, 'Ainakea Rd / Malolo St.', 96761),
      ainakea_fleming_lahaina: Detail.new(20.893979, -156.682797, 'Ainakea Rd / Fleming St.', 96761),
      ainakea_park_lahaina: Detail.new(20.895868, -156.682952, 'Ainakea Rd / Kaniau Rd', 96761),
      ainakea_kaniau_lahaina: Detail.new(20.899398, -156.683192, 'Ainakea Rd / Kaniau Rd', 96761),
      leialii_parkway_lahaina: Detail.new(20.901590, -156.682066, 'Leialii Parkway', 96761),
      lahaina_civic_center: Detail.new(20.905604, -156.684018, 'Lahaina Civic Center', 96761),
      whalers_village: Detail.new(20.921345, -156.693918, 'Whalers Village', 96761, true),
      front_street_505: Detail.new(20.867962, -156.675119, '505 Front Street', 96761),
      lahaina_aquatic_center: Detail.new(20.869246, -156.670994, 'Lahaina Aquatic Center', 96761),
      kuailua_kumukahi_lahaina: Detail.new(20.885413, -156.665247, 'Kuailua Street / Kumukahi Street', 96761),
      kalena_pikanele_lahaina: Detail.new(20.882914, -156.671184, 'Kalena Street / Pikanele Street', 96761),
      hale_mahaolu_eono: Detail.new(20.881210, -156.671852, 'Hale Mahaolu Eono', 96761),
      lahainaluna_kuhua: Detail.new(20.878601, -156.675486, 'Lahainaluna Rd. / Kuhua St.', 96761),
      lahainaluna_kuhua_across: Detail.new(20.878639, -156.675540, 'Lahainaluna Rd. / Kuhua St.', 96761),
      liloa_hokeo: Detail.new(20.886057, -156.667657, 'Liloa St. / Hokeo St.', 96761),
      na_halee: Detail.new(20.868956, -156.667994, 'Na Halee O Wainee', 96761),

      # Napili
      kekaa_drive: Detail.new(20.925355, -156.690942, "Keka'a Drive", 96761),
      kaanapali_beach_club: Detail.new(20.948582, -156.689587, 'Kaanapali Beach Club', 96761),
      kaanapali_shores: Detail.new(20.949199, -156.687894, 'Kaanapali Shores', 96761),
      nahono_place: Detail.new(20.950401, -156.687419, 'Nahono Place', 96761),
      honokowai_villa: Detail.new(20.951468, -156.687140, 'Honokowai Villa', 96761),
      honokowai_beach_park: Detail.new(20.953800, -156.686220, 'Sunset Terrace (Honokowai Beach Park)', 96761),
      honokowai_beach_park_makai: Detail.new(20.954103, -156.686204, 'Honokowai Beach Park', 96761),
      makani_sands: Detail.new(20.957264, -156.684847, 'Makani Sands', 96761),
      kuleana: Detail.new(20.961377, -156.683369, 'Kuleana', 96761),
      #lower_honopiilani_rd_halui: Detail.new(20.963028, -156.682790, 'Lower Honopiilani Rd / Halui', 96761),
      polynesian_shores: Detail.new(20.963686, -156.682490, 'Polynesian Shores', 96761),
      pohaku_park: Detail.new(20.967478, -156.681076, 'Pohaku Park (S-Turns)', 96761),
      valley_isle_resort: Detail.new(20.970798, -156.678409, 'Valley Isle Resort', 96761),
      kahana_manor: Detail.new(20.971195, -156.678408, 'Kahana Manor', 96761),
      royal_kahana: Detail.new(20.972387, -156.678760, 'Royal Kahana', 96761),
      kahana_outrigger: Detail.new(20.975601, -156.677404, 'Kahana Outrigger/Kepola Place', 96761),
      omaikai_place: Detail.new(20.977574, -156.676578, 'Omaikai Place', 96761),
      kahana_sunset: Detail.new(20.983765, -156.672176, 'Kahana Sunset', 96761),
      alaeloa_across: Detail.new(20.986200, -156.670802, 'Alaeloa (Mauka)', 96761),
      alaeloa: Detail.new(20.986645, -156.670128, 'Alaeloa', 96761),
      napili_plaza: Detail.new(20.985072, -156.667196, 'Napili Plaza', 96761),
      napili_shores: Detail.new(20.992067, -156.667072, 'Napili Shores', 96761),
      napili_village: Detail.new(20.994691, -156.665382, 'Napili Village', 96761),
      napili_kai: Detail.new(20.997119, -156.665188, 'Napili Kai', 96761),

      # Makawao
      alana_place_makawao: Detail.new(20.844813, -156.320190, 'Alana Place / Makawao Ave', 96768),
      haliimaile: Detail.new(20.868697, -156.338598, 'Haliimaile Park', 96768),
      koehana_place_makawao: Detail.new(20.838378, -156.326630, 'Koehana Place / Makawao Ave', 96768),
      longs_pukalani: Detail.new(20.823136, -156.329269, 'Longs Drugs Store / Kula Highway', 96768),
      eddie_tam: Detail.new(20.850275, -156.315563, 'Mahola St / Makawao Ave (Eddie Tam)', 96768),
      makani_road_makawao: Detail.new(20.848289, -156.317975, 'Makani Road / Makawao Ave', 96768),
      makawao_library: Detail.new(20.853548, -156.310623, 'Makawao Library', 96768),
      poalima_place_makawao: Detail.new(20.846347, -156.319157, 'Poalima Place / Makawao Ave', 96768),
      pukalani_terrace: Detail.new(20.838579, -156.341693, 'Pukalani Terrace', 96768, true),

      # Paia
      paia_entrance: Detail.new(20.915426, -156.383058, '134 Hana Highway (Baldwin Side)', 96779),
      paia_charleys: Detail.new(20.916779, -156.380424, "Charley's Restaurant", 96779),
      kuau_mart: Detail.new(20.927542, -156.366777, 'Kuau Mart', 96779),

      # Wailuku
      eha_st_ohukai: Detail.new(20.905449, -156.487441, 'Eha St. / Ohukai St.', 96793),
      eha_st_sack_n_save: Detail.new(20.905261, -156.487777, 'Eha St. - In Front Sack N Save', 96793),
      hawaiian_homes_makai: Detail.new(20.908586, -156.490213, 'Hawaiian Homes (Makai)', 96793),
      hawaiian_homes: Detail.new(20.908812, -156.490473, 'Hawaiian Homes', 96793),
      ka_hale_ake_ola: Detail.new(20.875702, -156.499342, 'Ka Hale A Ke Ola', 96793),
      kahekili_terrace: Detail.new(20.891196, -156.503605, 'Kahekili Terrace', 96793),
      kamole_st_kehalani_sub: Detail.new(20.875990, -156.502519, 'Kamole Street / Kehalani Subdivision', 96793),
      lihi_kanaloa_ave_parkside: Detail.new(20.897463, -156.485350, 'Lihi St. / Kanaloa Ave. (Parkside)', 96793),
      lihi_kanaloa_ave: Detail.new(20.897736, -156.485189, 'Lihi St. / Kanaloa Ave.', 96793),
      liholiho_kanaloa_ave: Detail.new(20.898852, -156.482544, 'Liholiho St. / Kanaloa Ave.', 96793),
      liholiho_kanaloa_ave_parkside: Detail.new(20.898734, -156.482517, 'Liholiho St. / Kanaloa Ave. (Parkside)', 96793),
      makaala_hale_mahaolu: Detail.new(20.910959, -156.492613, 'Makaala Drive - In Front Hale Mahaolu', 96793),
      makaala_kilihau_st: Detail.new(20.908817, -156.496119, 'Makaala Drive / Kilihau St.', 96793),
      makaala_kilihau_st_across: Detail.new(20.908568, -156.496456, 'Makaala Drive / Kilihau St.', 96793),
      makaala_alihilani_st: Detail.new(20.905104, -156.497440, 'Makaala Drive / Alihilani St.', 96793),
      makaala_kuhio_pl: Detail.new(20.903947, -156.498434, 'Makaala Drive / Kuhio Place', 96793),
      makaala_makamua_st: Detail.new(20.903248, -156.500495, 'Makaala Drive / Makamua St.', 96793),
      makaala_makamua_st_across: Detail.new(20.903278, -156.500271, 'Makaala Drive / Makamua St.', 96793),
      ke_ola_health_clinic: Detail.new(20.889012, -156.499604, 'Malama I Ke Ola Health Clinic', 96793),
      maui_lani_parkway: Detail.new(20.887706, -156.491017, 'Maui Lani Parkway', 96793),
      maui_memorial_hospital: Detail.new(20.884227, -156.488586, 'Maui Memorial Hospital', 96793),
      maui_memorial_hospital_across: Detail.new(20.884395, -156.488147, 'Maui Memorial Hospital (Across)', 96793),
      piihana_terrace: Detail.new(20.893834, -156.504926, "Pi'ihana Terrace", 96793),
      state_bldg: Detail.new(20.886598, -156.504729, 'State Office Building', 96793),
      state_bldg_wells_st: Detail.new(20.886182, -156.503795, 'State Building / Wells St.', 96793),
      waiehu_heights_wailupe: Detail.new(20.914519, -156.495191, 'Waiehu Heights / Wailupe Drive', 96793),
      waiehu_heights_aukai: Detail.new(20.914254, -156.497498, 'Waiehu Heights / Aukai Place', 96793),
      waikapu: Detail.new(20.854728, -156.503620, 'Waikapu', 96793),
      wailuku_post_office: Detail.new(20.893896, -156.498710, 'Wailuku Post Office', 96793),
      wailuku_community_center_across: Detail.new(20.900398, -156.491205, 'Wailuku Community Center (Across)', 96793),
      wailuku_community_center: Detail.new(20.900613, -156.491691, 'Wailuku Community Center', 96793),
      wailuku_ymca: Detail.new(20.895789, -156.486176, 'YMCA - Mikohu Loop / Kanaloa Ave.', 96793)
  }

  # some locations have "partners" which are usually on the other side of the street
  PARTNER_PATTERN = /_(across|parkside|makai|mauka)$/

  class << self

    def [](name)
      LIST[name]
    end

    def all
      LIST.dup
    end

    def unique
      all.reject { |k, v| k =~ PARTNER_PATTERN }
    end

    def transfers_only(list)
      list.reject { |l| !self[l].transfer? }.uniq
    end
  end

end