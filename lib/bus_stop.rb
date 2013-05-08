class BusStop

  attr_accessor :name, :times, :location, :hidden, :destination

  def initialize(options={})
    @location = options[:location]
    @times = options[:times] || []
    @name = options[:name]
    @hidden = options[:hidden]
    @destination = options[:destination]
  end

  def future_times(n=3)
    return_times = sorted_times.reject { |t| t < Time.zone.now }
    return_times = return_times.slice(0, n)
    if return_times.any?
      return_times
    else
      sorted_times.slice(0, n)
    end
  end

  def sorted_times
    @_sorted_times ||= times.map { |t| Time.zone.parse(t) }.sort { |a, b| a <=> b }
  end

end