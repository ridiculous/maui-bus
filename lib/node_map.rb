require 'node'
class NodeMap

  attr_reader :name, :names, :routes, :transfer_locations
  attr_accessor :nodes

  def initialize(route)
    @route = route
    @name = route.name
    @transfer_locations = route.transfer_locations
    @routes = Region.load_all.map(&:routes).flatten
    @nodes = []
    @names = []
  end

  def find_by_name(el_name)
    nodes.each do |node|
      my_node = node.find(el_name)
      return my_node if my_node
    end
    nil
  end

  def find_nodes(node)
    others = []
    routes.reject { |x| x.name == node.name }.each do |route|
      route.transfer_locations.each do |trans|
        if trans.match(Regexp.new("(#{(node.transfers |= [node.transfer]).join('|')})"))
          @names |= [node.name]
          unless others.detect { |n| n.name == route.name }
            others << Node.new(route, $1, node)
          end
        end
      end
    end
    others
  end

  def do_nodes
    transfer_locations.each do |transfer|
      base_node = Node.new(@route, transfer)
      base_node.nodes = find_nodes(base_node)
      base_node.nodes.each do |node|
        node.nodes = find_nodes(node)
        node.nodes.each do |inode|
          inode.nodes = find_nodes(inode)
        end
      end
      nodes << base_node
    end
  end
end