class BusStop

  attr_accessor :name, :times, :location, :hidden, :destination

  def initialize(options={})
    @location = options[:location]
    @times = options[:times] || []
    @name = options[:name]
    @hidden = options[:hidden]
    @destination = options[:destination]
  end

end