class BusStop

  attr_accessor :name, :times, :location

  def initialize(options={})
    @location = options[:location]
    @times = options[:times] || []
    @name = options[:name]
  end

end