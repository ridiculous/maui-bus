class Detail
  attr_reader :lat, :long, :name, :zip, :transfer

  def initialize(*args)
    @lat = args[0]
    @long = args[1]
    @name = args[2]
    @zip = args[3]
    @transfer = args[4] if args[4]
  end

  def coords
    "#{lat},#{long}"
  end

  def to_s
    "#{Location::ZIP_CODES[zip]} - #{name}"
  end

  def transfer?
    !transfer.nil?
  end

  def distance_to(point)
    lat1_rad = lat.to_rad
    lat2_rad = point.lat.to_rad
    long_rad = (point.long - long).to_rad
    earth_radius = 6371 # in km
    distance_in_km = Math.acos(
      Math.sin(lat1_rad) *
        Math.sin(lat2_rad) +
        Math.cos(lat1_rad) *
          Math.cos(lat2_rad) *
          Math.cos(long_rad)) * earth_radius

    distance_in_km / 1.609344 # to miles
  end
end