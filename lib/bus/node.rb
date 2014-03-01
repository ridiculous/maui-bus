module Bus
  class Node

    attr_reader :parent, :stops
    attr_accessor :name, :transfer, :nodes, :transfers

    def initialize(route, transfer, parent=nil)
      @name = route.name
      @transfer = transfer
      @transfers = route.transfer_locations
      @nodes = []
      @parent = parent
      @stops = route.locations.uniq
    end

    # find this node if not already found, else search its nodes (recursive)
    def find(el_name, others=[])
      if stops.include?(el_name) && others.exclude?(name)
        self
      else
        nodes.each do |n|
          desired_node = n.find(el_name, others)
          return desired_node if desired_node
        end
        nil
      end
    end

    def find_stop_or_default(stop_name, default_val = nil)
      stop_name && stops.include?(stop_name) ? stop_name : default_val
    end
  end
end