class Location

  LIST = {
      queen_kaahumanu: LocationDetail.new(*Coords::QUEEN_KAAHUMANU, '275 W Kaahumanu Ave, Kahului', 96732),
      queen_kaahumanu_back: LocationDetail.new(*Coords::QUEEN_KAAHUMANU_BACK, 'W Wakea Street, Kahului', 96732),
      kahului_salvation_army: LocationDetail.new(*Coords::KAHULUI_SALVATION_ARMY, '45 W Kamehameha Ave, Kahului', 96732),
      kahului_airport: LocationDetail.new(*Coords::KAHULUI_AIRPORT, 'Airport Pick-up Zone #3, Kahului', 96732),
      pukalani_terrace: LocationDetail.new(*Coords::PUKALANI_TERRACE, '55 Pukalani St, Pukalani', 96768),
      makawao_library: LocationDetail.new(*Coords::MAKAWAO_LIBRARY, '1159 Makawao Ave, Makawao', 96768),
      haliimaile: LocationDetail.new(*Coords::HALIIMAILE, 'Haliimaile Park, Makawao', 96768),
      koehana_place_makawao: LocationDetail.new(*Coords::KOEHANA_PLACE, 'Koehana Place / Makawao Ave, Makawao', 96768),
      paia_charleys: LocationDetail.new(*Coords::PAIA_CHARLEYS, 'Luna Lane / [181] Hana Highway, Paia', 96779),
      paia_entrance: LocationDetail.new(*Coords::PAIA_ENTRANCE, '134 Hana Highway, Paia', 96779),
      haiku_marketplace: LocationDetail.new(*Coords::HAIKU_MARKETPLACE, '810 Haiku Road, Haiku', 96708),
      haiku_community_center: LocationDetail.new(*Coords::HAIKU_COMMUNITY_CENTER, 'Haiku Community Center, Haiku', 96708),
      kuau_mart: LocationDetail.new(*Coords::KUAU_MART, 'Kuau Mart, Paia', 96779),
      alana_place_makawao: LocationDetail.new(*Coords::ALANA_PLACE, 'Alana Place / Makawao Ave, Makawao', 96779),
      poalima_place_makawao: LocationDetail.new(*Coords::POALIMA_PLACE, 'Poalima Place / Makawao Ave, Makawao', 96779),
      makani_road_makawao: LocationDetail.new(*Coords::MAKANI_ROAD_MAKAWAO_AVE, 'Makani Road / Makawao Ave, Makawao', 96779),
      eddie_tam: LocationDetail.new(*Coords::EDDIE_TAM, 'Mahola St / Makawao Ave, Makawao', 96779),
      longs_pukalani: LocationDetail.new(*Coords::LONGS_PUKALANI, 'Aapueo Parkway / Kula Highway, Pukalani', 96768),
      waimele_place_kula: LocationDetail.new(*Coords::WAIMELE_PLACE_KULA, 'Lower Kula Rd. / Waimele Place, Kula', 96790),
      lower_kimo_drive: LocationDetail.new(*Coords::LOWER_KIMO_DRIVE, 'Lower Kula Rd. / Lower Kimo Dr., Kula', 96790),
      kula_hardware: LocationDetail.new(*Coords::KULA_HARDWARE, 'Kula Hardware, Kula', 96790),
      kula_community_center: LocationDetail.new(*Coords::KULA_COMMUNITY_CENTER, 'Kula Community Center, Kula', 96790),
      kula_gym: LocationDetail.new(*Coords::KULA_GYM, 'Kula Community Center, Kula', 96790),
      naalae_road: LocationDetail.new(*Coords::NAALAE_ROAD, 'Lower Kula Rd. / Naalae Rd., Kula', 96790),
      rice_park: LocationDetail.new(*Coords::RICE_PARK, 'Rice Park, Kula', 96790),

      wharf_cinema: LocationDetail.new(*Coords::WHARF_CINEMA, 'Wharf Cinema Center Luakini Street, Lahaina', 96790),
      papalaua_st: LocationDetail.new(*Coords::PAPALAUA_ST, 'Papalaua Street, Lahaina', 96761),
      lahaina_cannery_mall: LocationDetail.new(*Coords::LAHAINA_CANNERY_MALL, 'Lahaina Cannery Mall, Lahaina', 96761),
      lahaina_gateway: LocationDetail.new(*Coords::LAHAINA_GATEWAY, 'Lahaina Gateway, Lahaina', 96761),
      ainakea_malolo_lahaina: LocationDetail.new(*Coords::AINAKEA_MALOLO_LAHAINA, 'Ainakea Rd / Malolo St., Lahaina', 96761),
      ainakea_fleming_lahaina: LocationDetail.new(*Coords::AINAKEA_FLEMING_LAHAINA, 'Ainakea Rd / Fleming St., Lahaina', 96761),
      ainakea_park_lahaina: LocationDetail.new(*Coords::AINAKEA_PARK_LAHAINA, 'Ainakea Rd / Kaniau Rd, Lahaina', 96761),
      ainakea_kaniau_lahaina: LocationDetail.new(*Coords::AINAKEA_KANIAU_LAHAINA, 'Ainakea Rd / Kaniau Rd, Lahaina', 96761),
      leialii_parkway_lahaina: LocationDetail.new(*Coords::LEIALII_PARKWAY, 'Leialii Parkway, Lahaina', 96761),
      lahaina_civic_center: LocationDetail.new(*Coords::LAHAINA_CIVIC_CENTER, 'Lahaina Civic Center, Lahaina', 96761),
      whalers_village: LocationDetail.new(*Coords::WHALERS_VILLAGE, 'Whalers Village, Lahaina', 96761),
      front_street_505: LocationDetail.new(*Coords::FRONT_STREET_505, '505 Front Street, Lahaina', 96761),
      lahaina_aquatic_center: LocationDetail.new(*Coords::LAHAINA_AQUATIC_CENTER, 'Lahaina Aquatic Center, Lahaina', 96761),
      kuailua_kumukahi_lahaina: LocationDetail.new(*Coords::KUAILUA_KUMUKAHI_LAHAINA, 'Kuailua Street / Kumukahi Street, Lahaina', 96761),
      kalena_pikanele_lahaina: LocationDetail.new(*Coords::KALENA_PIKANELE_LAHAINA, 'Kalena Street / Pikanele Street, Lahaina', 96761),
      maalaea_harbor: LocationDetail.new(*Coords::MAALAEA_HARBOR, 'Maalaea Harbor, Kihei', 96753),
      state_bldg: LocationDetail.new(*Coords::STATE_BLDG, 'State Building, Wailuku', 96793),
      state_bldg_wells_st: LocationDetail.new(*Coords::STATE_BLDG_WELLS_ST, 'State Building / Wells St., Wailuku', 96793),

      # kahului
      kahului_safeway: LocationDetail.new(*Coords::KAHULUI_SAFEWAY, 'Kamehameha Ave. / Hoohana St., Kahului', 96732),
      kahului_safeway_across: LocationDetail.new(*Coords::KAHULUI_SAFEWAY_ACROSS, 'Kamehameha Ave. / Maui Mall Entrance, Kahului', 96732),
  }

  def self.[](name)
    LIST[name]
  end
end