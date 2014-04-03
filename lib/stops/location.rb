class Location

  class Nearby < Struct.new(:distance, :name, :detail)
    def <=>(other)
      distance <=> other.distance
    end
  end

  ZIP_CODES = {
    96708 => 'Haiku',
    96732 => 'Kahului',
    96753 => 'Kihei',
    96790 => 'Kula',
    96761 => 'Lahaina',
    96768 => 'Makawao',
    96779 => 'Paia',
    96793 => 'Wailuku'
  }

  PARTNER_PATTERN = /_(across|parkside|makai|mauka)$/

  class << self

    def find(name)
      LIST[name]
    end

    alias :[] :find

    def all
      LIST.dup
    end

    # some locations have "partners" which are usually on the other side of the street
    def unique
      all.reject { |k, _| k =~ PARTNER_PATTERN }
    end

    # a[0] => name   {Symbol}
    # a[1] => detail {Detail}
    def sorted
      unique.sort { |a, b| a[1] <=> b[1] }
    end

    #  <# latitude, longitude, address, zip >
    def load_locations
      data_file = open('config/locations/list.yml')
      YAML.load(data_file).inject({}) do |result, loc|
        result[loc[0].intern] = Detail.new(*loc[1])
        result
      end
    end

    # <lat> - latitude
    # <long> - longitude
    # <threshold> - distance cutoff in miles
    def find_with_coordinates(lat, long, threshold = 0.5)
      point_a = Detail.new(lat, long)
      [].tap do |locations|
        all.each do |name, point_b|
          distance = point_a.distance_to(point_b)
          locations << Nearby.new(distance, name, point_b) if distance < threshold
        end
      end.sort
    end
  end

  LIST = load_locations
end