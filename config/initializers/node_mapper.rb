require 'region'

Region::ALL = Region.load_all.map(&:routes).flatten
Region::NODE_MAP = Region::ALL.inject({}) { |result, bus_route| result[bus_route.name] = bus_route.node_map; result }