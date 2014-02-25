# load the node mapping into memory (cache) when the app boots. Triggered in initializers/load_bus_data.rb
module Bus
  module Data

    def self.load
      routes.length
      node_map.length
    end

    def self.routes
      @_bus_routes ||= Region.load_all.map(&:routes).flatten
    end

    def self.node_map
      @_node_map ||= routes.inject({}) { |result, bus_route| result[bus_route.name] = bus_route.node_map; result }
    end

  end
end