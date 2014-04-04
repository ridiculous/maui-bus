module Bus
  class Stop

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
      @true_location = options[:true_location] || location.to_s
      @destination = options[:destination] if options[:destination]
    end

    def transfer?
      location && Location[location].transfer
    end

    def future_times(n=3, cutoff=Time.zone.now)
      return_times = sorted_times.reject { |t| t < cutoff }
      return_times = return_times.take(n)
      if return_times.any?
        return_times
      else
        sorted_times.take(n)
      end
    end

    def sorted_times
      self.class.sort_times(times)
    end

    def time_to_s(i)
      my_time = times[i]
      if my_time && !my_time.empty?
        hr = my_time.to_i # converts '12:55' to 12
        if hr > 11
          "#{hr == 12 ? hr : hr - 12}#{my_time.slice(2, 5)} PM"
        else
          "#{my_time} AM"
        end
      end
    end

    def to_key(i)
      "#{name}#{times[i]}"
    end

    def times_for_bus(total_buses, bus)
      times.each_with_index.select { |_, i| i % total_buses == bus }.map { |t| t[0] }
    end

    def find_time(the_time)
      times.find { |t| t == the_time }
    end

    #
    # = Class Methods
    #

    def self.sort_times(timez)
      timez.map { |t| Time.zone.parse(t) unless t.empty? }.compact.sort { |a, b| a <=> b }
    end

  end
end