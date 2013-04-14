class Location

  LIST = {
      queen_kaahumanu: LocationDetail.new(*Coords::QUEEN_KAAHUMANU, '275 W Kaahumanu Ave, Kahului', 96732),
      queen_kaahumanu_back: LocationDetail.new(*Coords::QUEEN_KAAHUMANU_BACK, 'W Wakea Street, Kahului', 96732),
      kahului_salvation_army: LocationDetail.new(*Coords::KAHULUI_SALVATION_ARMY, '45 W Kamehameha Ave, Kahului', 96732),
      kahului_airport: LocationDetail.new(*Coords::KAHULUI_AIRPORT, 'Kahului Airport Pick-up Zone #3, Kahului', 96732),
      pukalani_terrace: LocationDetail.new(*Coords::PUKALANI_TERRACE, '55 Pukalani St, Pukalani', 96768),
      makawao_library: LocationDetail.new(*Coords::MAKAWAO_LIBRARY, '1159 Makawao Ave, Makawao', 96768),
      haliimaile: LocationDetail.new(*Coords::HALIIMAILE, 'Haliimaile Park, Makawao', 96768),
      makawao_avenue_300: LocationDetail.new(*Coords::MAKAWAO_AVENUE_300, '300 Makawao Avenue, Makawao', 96768),
      paia_charleys: LocationDetail.new(*Coords::PAIA_CHARLEYS, 'Luna Lane / [181] Hana Highway', 96779),
      paia_entrance: LocationDetail.new(*Coords::PAIA_ENTRANCE, '134 Hana Highway', 96779),
      haiku_marketplace: LocationDetail.new(*Coords::HAIKU_MARKETPLACE, '810 Haiku Road', 96708),
      haiku_community_center: LocationDetail.new(*Coords::HAIKU_COMMUNITY_CENTER, 'Haiku Community Center', 96708),
      kuau_mart: LocationDetail.new(*Coords::KUAU_MART, 'Kuau Mart', 96779),
  }

  def self.[](name)
    LIST[name]
  end
end