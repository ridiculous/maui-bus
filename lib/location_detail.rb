class LocationDetail
  attr_reader :lat, :long, :street, :zip, :transfer

  def initialize(*args)
    @lat, @long, @street, @zip, @transfer = *args
  end

  def coords
    "#{lat},#{long}"
  end
end