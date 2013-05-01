class LocationDetail
  attr_reader :lat, :long, :street, :zip

  def initialize(*args)
    @lat = args[0]
    @long = args[1]
    @street = args[2]
    @zip = args[3]
  end

  def coords
    "#{lat},#{long}"
  end
end