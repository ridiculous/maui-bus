class BusStop

  attr_accessor :name, :times, :location, :destination
  attr_reader :true_location

  def initialize(options={})
    @location = options[:location]
    @times = options[:times] || []
    @name = if location && !options[:name]
              Location[location].name
            else
              options[:name]
            end
    @true_location = options[:true_location]
    @destination = options[:destination] if options[:destination]
  end

  def transfer?
    location && Location[location].transfer
  end

  def future_times(n=3, cutoff=Time.zone.now)
    return_times = sorted_times.reject { |t| t < cutoff }
    return_times = return_times.slice(0, n)
    if return_times.any?
      return_times
    else
      sorted_times.slice(0, n)
    end
  end

  def sorted_times
    self.class.sort_times(times)
  end

  #
  # = Class Methods
  #

  def self.sort_times(timez)
    timez.map { |t| Time.zone.parse(t) unless t.empty? }.compact.sort { |a, b| a <=> b }
  end

end