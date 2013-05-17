class Detail
  attr_reader :lat, :long, :street, :zip, :transfer, :phone

  def initialize(*args)
    @lat, @long, @street, @zip, @transfer, @phone = *args
  end

  def coords
    "#{lat},#{long}"
  end
end