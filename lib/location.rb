class Location

  LIST = {
      queen_kaahumanu: Detail.new(*Coords::QUEEN_KAAHUMANU, '275 W Kaahumanu Ave, Kahului', 96732),
      queen_kaahumanu_back: Detail.new(*Coords::QUEEN_KAAHUMANU_BACK, 'W Wakea Street, Kahului', 96732),
      kahului_salvation_army: Detail.new(*Coords::KAHULUI_SALVATION_ARMY, '45 W Kamehameha Ave, Kahului', 96732),
      kahului_airport: Detail.new(*Coords::KAHULUI_AIRPORT, 'Kahului Airport Pick-up Zone #3, Kahului', 96732),
      pukalani_terrace: Detail.new(*Coords::PUKALANI_TERRACE, '55 Pukalani St, Pukalani', 96768),
      makawao_library: Detail.new(*Coords::MAKAWAO_LIBRARY, '1159 Makawao Ave, Makawao', 96768),
      haliimaile: Detail.new(*Coords::HALIIMAILE, 'Haliimaile Park, Makawao', 96768),
      makawao_avenue_300: Detail.new(*Coords::MAKAWAO_AVENUE_300, '300 Makawao Avenue, Makawao', 96768),
  }

  def self.[](name)
    LIST[name]
  end
end