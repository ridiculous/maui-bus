class Location

  #  <# latitude, longitude, address, zip >
LIST = {
      # Kahului
      queen_kaahumanu: LocationDetail.new(20.886570, -156.475375, '275 W Kaahumanu Ave, Kahului', 96732, true),
      queen_kaahumanu_back: LocationDetail.new(20.884325, -156.476362, 'W Wakea Street, Kahului', 96732),
      kahului_salvation_army: LocationDetail.new(20.88789, -156.4676064, '45 W Kamehameha Ave, Kahului', 96732),
      kahului_salvation_army_across: LocationDetail.new(20.888100, -156.467757, '45 W Kamehameha Ave, Kahului', 96732),
      kahului_airport: LocationDetail.new(20.8943, -156.4377, 'Airport Pick-up Zone #3, Kahului', 96732),
      kahului_safeway: LocationDetail.new(20.889237, -156.464077, 'Kamehameha Ave. / Hoohana St., Kahului', 96732),
      kahului_safeway_across: LocationDetail.new(20.889402, -156.464152, 'Kamehameha Ave. / Maui Mall Entrance, Kahului', 96732),

      # Makawao
      pukalani_terrace: LocationDetail.new(20.838579, -156.341693, '55 Pukalani St, Pukalani', 96768, true),
      makawao_library: LocationDetail.new(20.853548, -156.310623, '1159 Makawao Ave, Makawao', 96768),
      haliimaile: LocationDetail.new(20.868697, -156.338598, 'Haliimaile Park, Makawao', 96768),
      koehana_place_makawao: LocationDetail.new(20.838378, -156.326630, 'Koehana Place / Makawao Ave, Makawao', 96768),
      longs_pukalani: LocationDetail.new(20.823136, -156.329269, 'Aapueo Parkway / Kula Highway, Pukalani', 96768),

      # Paia
      paia_charleys: LocationDetail.new(20.916779, -156.380424, 'Luna Lane / [181] Hana Highway, Paia', 96779),
      paia_entrance: LocationDetail.new(20.915426, -156.383058, '134 Hana Highway, Paia', 96779),
      kuau_mart: LocationDetail.new(20.927542, -156.366777, 'Kuau Mart, Paia', 96779),
      alana_place_makawao: LocationDetail.new(20.844813, -156.320190, 'Alana Place / Makawao Ave, Makawao', 96779),
      poalima_place_makawao: LocationDetail.new(20.846347, -156.319157, 'Poalima Place / Makawao Ave, Makawao', 96779),
      makani_road_makawao: LocationDetail.new(20.848289, -156.317975, 'Makani Road / Makawao Ave, Makawao', 96779),
      eddie_tam: LocationDetail.new(20.850275, -156.315563, 'Mahola St / Makawao Ave (Eddie Tam), Makawao', 96779),

      # Kula
      waimele_place_kula: LocationDetail.new(20.791424, -156.324731, 'Lower Kula Rd. / Waimele Place, Kula', 96790),
      lower_kimo_drive: LocationDetail.new(20.787352, -156.325396, 'Lower Kula Rd. / Lower Kimo Dr., Kula', 96790),
      kula_hardware: LocationDetail.new(20.776915, -156.325844, 'Kula Hardware, Kula', 96790),
      kula_community_center: LocationDetail.new(20.763643, -156.326635, 'Kula Community Center, Kula', 96790),
      kula_gym: LocationDetail.new(20.759625, -156.327381, 'Kula Community Center, Kula', 96790),
      naalae_road: LocationDetail.new(20.749447, -156.329543, 'Lower Kula Rd. / Naalae Rd., Kula', 96790),
      rice_park: LocationDetail.new(20.741641, -156.332327, 'Rice Park, Kula', 96790),

      # Haiku
      haiku_marketplace: LocationDetail.new(20.913502, -156.322564, '810 Haiku Road, Haiku', 96708),
      haiku_community_center: LocationDetail.new(20.929556, -156.321201, 'Haiku Community Center, Haiku', 96708),

      # Lahaina
      wharf_cinema: LocationDetail.new(20.872799, -156.676799, 'Wharf Cinema Center Luakini Street, Lahaina', 96761, true),
      papalaua_st: LocationDetail.new(20.877316, -156.680821, 'Papalaua Street, Lahaina', 96761),
      lahaina_cannery_mall: LocationDetail.new(20.886098, -156.683599, 'Lahaina Cannery Mall, Lahaina', 96761),
      lahaina_gateway: LocationDetail.new(20.885035, -156.681439, 'Lahaina Gateway, Lahaina', 96761),
      ainakea_malolo_lahaina: LocationDetail.new(20.890104, -156.682558, 'Ainakea Rd / Malolo St., Lahaina', 96761),
      ainakea_fleming_lahaina: LocationDetail.new(20.893979, -156.682797, 'Ainakea Rd / Fleming St., Lahaina', 96761),
      ainakea_park_lahaina: LocationDetail.new(20.895868, -156.682952, 'Ainakea Rd / Kaniau Rd, Lahaina', 96761),
      ainakea_kaniau_lahaina: LocationDetail.new(20.899398, -156.683192, 'Ainakea Rd / Kaniau Rd, Lahaina', 96761),
      leialii_parkway_lahaina: LocationDetail.new(20.901590, -156.682066, 'Leialii Parkway, Lahaina', 96761),
      lahaina_civic_center: LocationDetail.new(20.905604, -156.684018, 'Lahaina Civic Center, Lahaina', 96761),
      whalers_village: LocationDetail.new(20.921345, -156.693918, 'Whalers Village, Lahaina', 96761),
      front_street_505: LocationDetail.new(20.867962, -156.675119, '505 Front Street, Lahaina', 96761),
      lahaina_aquatic_center: LocationDetail.new(20.869246, -156.670994, 'Lahaina Aquatic Center, Lahaina', 96761),
      kuailua_kumukahi_lahaina: LocationDetail.new(20.885413, -156.665247, 'Kuailua Street / Kumukahi Street, Lahaina', 96761),
      kalena_pikanele_lahaina: LocationDetail.new(20.882914, -156.671184, 'Kalena Street / Pikanele Street, Lahaina', 96761),
      hale_mahaolu_eono: LocationDetail.new(20.881210, -156.671852, 'Hale Mahaolu Eono, Lahaina', 96761),
      lahainaluna_kuhua: LocationDetail.new(20.878601, -156.675486, 'Lahainaluna Rd. / Kuhua St., Lahaina', 96761),
      lahainaluna_kuhua_across: LocationDetail.new(20.878639, -156.675540, 'Lahainaluna Rd. / Kuhua St., Lahaina', 96761),
      liloa_hokeo: LocationDetail.new(20.886057, -156.667657, 'Liloa St. / Hokeo St., Lahaina', 96761),
      na_halee: LocationDetail.new(20.868956, -156.667994, 'Na Halee O Wainee, Lahaina', 96761),

      # Kihei
      maalaea_harbor: LocationDetail.new(20.792111, -156.513081, 'Maalaea Harbor', 96753, true),
      uwapo_south_kihei: LocationDetail.new(20.781604, -156.462809, 'Uwapo Rd. / S. Kihei Rd.', 96753),
      uwapo_south_kihei_mauka: LocationDetail.new(20.781346, -156.462543, 'Uwapo Rd. / S. Kihei Rd.', 96753),
      ohukai_south_kihei: LocationDetail.new(20.774610, -156.460244, 'Ohukai Rd. / S. Kihei Rd.', 96753),
      kaonoulu_south_kihei_makai: LocationDetail.new(20.766397, -156.458482, 'Kaonoulu St. / S. Kihei Rd.', 96753),
      kaonoulu_south_kihei: LocationDetail.new(20.765203, -156.458230, 'Kaonoulu St. / S. Kihei Rd.', 96753),
      kulanihakoi_south_kihei: LocationDetail.new(20.761200, -156.457790, 'Kulanihakoi St. / S. Kihei Rd.', 96753),
      waipuilani_south_kihei: LocationDetail.new(20.755096, -156.456610, 'Waipuilani Rd. / S. Kihei Rd.', 96753),
      waipuilani_south_kihei_makai: LocationDetail.new(20.755813, -156.456884, 'Waipuilani Rd. / S. Kihei Rd.', 96753),
      piikea_south_kihei_across: LocationDetail.new(20.750235, -156.455124, 'Piikea Ave. / S. Kihei Rd.', 96753),
      piikea_south_kihei: LocationDetail.new(20.750390, -156.454879, 'Piikea Ave. / S. Kihei Rd.', 96753),
      piilani_shopping_center: LocationDetail.new(20.751888, -156.448445, 'Piilani Shopping Center', 96753, true),
      lipoa_liloa: LocationDetail.new(20.748173, -156.450178, 'E Lipoa St. / Liloa Dr.', 96753),
      lipoa_liloa_across: LocationDetail.new(20.748032, -156.449851, 'E Lipoa St. / Liloa Dr.', 96753),
      st_theresas_church: LocationDetail.new(20.747009, -156.455033, "St Theresa's Church", 96753),
      welakahao_south_kihei: LocationDetail.new(20.739706, -156.454144, "Welakahao Rd. / S. Kihei Rd.", 96753),
      welakahao_south_kihei_mauka: LocationDetail.new(20.740292, -156.454136, "Welakahao Rd. / S. Kihei Rd.", 96753),
      lipoa_street: LocationDetail.new(20.747614, -156.454702, "Lipoa St.", 96753),
      keala_place_south_kihei: LocationDetail.new(20.732112, -156.452235, "Keala Pl. / South Kihei", 96753),
      keala_place_south_kihei_mauka: LocationDetail.new(20.732890, -156.452435, "Keala Pl. / South Kihei", 96753),
      walaka_south_kihei: LocationDetail.new(20.726697, -156.448510, "Walaka St. / South Kihei", 96753),
      kamaole_beach_1: LocationDetail.new(20.721211, -156.447162, "Kamaole Beach I", 96753),
      kamaole_shopping_center: LocationDetail.new(20.718593, -156.446616, "Kamaole Shopping Center", 96753),
      kamaole_beach_3: LocationDetail.new(20.712895, -156.445337, "Kamaole Beach III", 96753),
      mana_kai_resort_south: LocationDetail.new(20.705098, -156.444966, 'Mana Kai Resort (South)', 96753),
      kilohana_south_kihei: LocationDetail.new(20.702001, -156.444658, 'Kilohana Dr. / S. Kihei Rd.', 96753),
      okolani_wailea: LocationDetail.new(20.698260, -156.442818, 'Okolani / Wailea Alanui Dr.', 96753),
      wailea_ike: LocationDetail.new(20.686904, -156.437995, 'Wailea Ike Drive', 96753),

      # Wailuku
      state_bldg: LocationDetail.new(20.886598, -156.504729, 'State Building, Wailuku', 96793),
      state_bldg_wells_st: LocationDetail.new(20.886182, -156.503795, 'State Building / Wells St., Wailuku', 96793),
  }

  def self.[](name)
    LIST[name]
  end
end