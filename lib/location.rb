class Location

  LIST = {
      queen_kaahumanu: LocationDetail.new(*Coords::QUEEN_KAAHUMANU, '275 W Kaahumanu Ave, Kahului', 96732),
      queen_kaahumanu_back: LocationDetail.new(*Coords::QUEEN_KAAHUMANU_BACK, 'W Wakea Street, Kahului', 96732),
      kahului_salvation_army: LocationDetail.new(*Coords::KAHULUI_SALVATION_ARMY, '45 W Kamehameha Ave, Kahului', 96732),
      kahului_airport: LocationDetail.new(*Coords::KAHULUI_AIRPORT, 'Kahului Airport Pick-up Zone #3, Kahului', 96732),
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
  }

  def self.[](name)
    LIST[name]
  end
end