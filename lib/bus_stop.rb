class BusStop

  attr_accessor :name, :times, :location, :destination

  def initialize(options={})
    @location = options[:location]
    @times = options[:times] || []
    @name = if location && !options[:name]
              Location[location].name
            else
              options[:name]
            end
    @destination = options[:destination]
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

  # remove mauka, makai, across, etc from the location name
  def true_location
    location.to_s.sub(Location::PARTNER_PATTERN, '')
  end

  #
  # = Class Methods
  #

  def self.sort_times(timez)
    timez.map { |t| Time.zone.parse(t) unless t.empty? }.compact.sort { |a, b| a <=> b }
  end

end