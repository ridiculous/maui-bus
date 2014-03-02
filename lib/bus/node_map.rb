module Bus
  class NodeMap

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

    def find_nodes(node)
      others = []
      node.transfers |= [node.transfer]
      routes.reject { |x| x.name == node.name }.each do |route|
        route.transfer_locations.each do |trans|
          if !others.detect { |n| n.name == route.name } && trans.in?(node.transfers)
            others << Node.new(route, trans, node)
          end
        end
      end
      others
    end

    # Four levels of mapping seems to cover every possible search combination
    def map_nodes
      transfer_locations.each do |transfer|
        base_node = Node.new(@route, transfer)
        base_node.nodes = find_nodes(base_node)
        base_node.nodes.each do |node|
          node.nodes = find_nodes(node)
          node.nodes.each do |inode|
            inode.nodes = find_nodes(inode)
            inode.nodes.each do |iinode|
              iinode.nodes = find_nodes(iinode)
            end
          end
        end
        nodes << base_node
      end
    end
  end
end