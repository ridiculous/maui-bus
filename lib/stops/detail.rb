class Detail
  attr_reader :lat, :long, :name, :zip, :transfer

  def initialize(*args)
    @lat, @long, @name, @zip, @transfer = *args
  end

  def coords
    "#{lat},#{long}"
  end

  def to_s
    "#{Location::ZIP_CODES[zip]} - #{name}"
  end

  def transfer?
    transfer
  end
end