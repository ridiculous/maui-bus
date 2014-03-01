class Detail
  attr_reader :lat, :long, :name, :zip, :transfer

  def initialize(*args)
    @lat = args[0]
    @long = args[1]
    @name = args[2]
    @zip = args[3]
    @transfer  = args[4] if args[4]
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