require 'forwardable'
require 'yaml'

module Bus
  # meant to be used as a template
  class Route
    extend Forwardable

    attr_accessor :name, :stops, :operator, :note
    attr_reader :_class_name
    attr_writer :next_stops_cache

    def_delegators :operator, :next_stops, :next_stops_as_hash, :find_between

    def self.load_stops(klass)
      data_file = open("config/routes/#{klass.to_s.underscore}.yml")
      klass.const_set(:STOPS, ::YAML.load(data_file).map { |data| Stop.new(data.symbolize_keys) })
    end

    def self.reset_stops
      remove_const(:STOPS)
    end

    def initialize(name, total_buses=1, options={})
      @name = name
      @stops = self.class.const_get(:STOPS).clone
      @operator = Operator.new(self, total_buses, options)
    end

    def max_stop_length
      stops.map(&:times).map(&:length).sort[-1]
    end

    def class_name
      full_class_name.sub(/^[a-z]+_/, '')
    end

    def full_class_name
      @_class_name ||= underscore_name.gsub('/', '_')
    end

    # path to the routes map
    def path_parts
      @_path_parts ||= underscore_name.split('/')
    end

    def underscore_name
      self.class.to_s.underscore
    end

    # cache the stops
    def next_stops_cache
      @next_stops_cache ||= operator.next_stops
    end

    def transfer_locations
      @_transfer_locations ||= transfers.map(&:location).map(&:to_s).uniq
    end

    # used in searching, data is loaded into Bus::Data on init
    def node_map
      nm = NodeMap.new(self)
      nm.map_nodes
      nm
    end

    def locations
      stops.map { |s| s.true_location }
    end

    def clear_cache
      @next_stops_cache = nil
    end

    def stops_at?(location)
      !stops.detect { |s| s.location == location }.nil?
    end

    def find(name)
      stops.select { |s| s.location == name.to_sym }
    end

    private

    def transfers
      stops.select { |s| s.transfer? }
    end
  end
end
