class BusStop

  attr_accessor :name, :times, :location, :display_order

  def initialize(options={}, display_order=0)
    @location = options[:location]
    @times = options[:times] || []
    @name = options[:name]
    @display_order = display_order
  end

end