class Location

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

  class << self

    def [](name)
      LIST[name]
    end

    def all
      LIST.dup
    end

    # some locations have "partners" which are usually on the other side of the street
    def unique
      all.reject { |k, v| k =~ /_(across|parkside|makai|mauka)$/ }
    end

    def transfers_only(list)
      list.reject { |l| !self[l].transfer? }.uniq
    end

    #  <# latitude, longitude, address, zip >
    def load_locations
      data_file = open('config/locations/list.yml')
      YAML.load(data_file).inject({}) do |result, loc| 
         result[loc.keys.first.intern] = Detail.new(*loc.values.first);result
      end
    end
  end
  
  LIST = load_locations
end