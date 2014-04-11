module Bus
  class NodeMap

    # Four levels of mapping seems to cover every possible search combination
    MAX_NODE_LEVEL = 4

    attr_reader :name, :routes, :transfer_locations
    attr_accessor :nodes

    def initialize(route)
      @route = route
      @name = route.name
      @transfer_locations = route.transfer_locations
      @routes = Data.routes
      @nodes = []
    end

    def find_by_name(el_name, others=[])
      nodes.each do |node|
        my_node = node.find(el_name, others)
        return my_node if my_node
      end
      nil
    end

    def map_nodes
      transfer_locations.each do |transfer|
        nodes << Node.new(@route, transfer)
        set_child_nodes(nodes.first)
      end
    end

    private

    def set_child_nodes(node, num = 1)
      return if num > MAX_NODE_LEVEL
      node.nodes = find_connecting_nodes(node)
      node.nodes.each do |n|
        set_child_nodes(n, num + 1)
      end
    end

    def find_connecting_nodes(node)
      Collection.new.tap do |others|
        node.transfers |= [node.transfer]
        routes.reject_by_name(node.name).each do |route|
          route.transfer_locations.each do |trans|
            if node.transfers.include?(trans) && others.find_by_name(route.name).nil?
              others << Node.new(route, trans, node)
            end
          end
        end
      end
    end
  end
end