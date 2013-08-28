class Node

  attr_reader :parent, :stops
  attr_accessor :name, :transfer, :nodes, :transfers

  def initialize(route, transfer, parent=nil)
    @name = route.name
    @transfer = transfer
    @transfers = route.transfer_locations
    @nodes = []
    @parent = parent
    @stops = route.stops.map(&:true_location).uniq
  end

  def find(el_name)
    if stops.include?(el_name)
      self
    else
      nodes.each do |n|
        desired_node = n.find(el_name)
        return desired_node if desired_node
      end
      nil
    end
  end
end