require 'leg'

class Course
  attr_accessor :first_leg, :last_legs, :other_legs, :nodes

  class Legs < Array
    def completed
      reject { |a| a.incomplete? }
    end
  end

  def initialize(first_leg = nil, last_legs = [], others = [])
    @first_leg = first_leg
    @last_legs = Legs.new(last_legs)
    @other_legs = others
    @nodes = []
  end

  def latest_leg
    other_legs[-1] || first_leg
  end

  def leg_length
    1 + other_legs.length + (last_legs ? 1 : 0)
  end

  def <=>(other)
    if leg_length == other.leg_length
      first_leg <=> other.first_leg
    else
      leg_length <=> other.leg_length
    end
  end

  # climb the node tree (so lovely)
  def complete_legs_from_nodes(destination)
    transfers = []
    nodes.each do |course_node|
      node = course_node
      while node
        last_transfer = node.transfer
        has_origin = node.stops.include?(first_leg.start_at)
        has_destination = node.stops.include?(destination)
        my_route = BusData.routes.find { |x| x.name == node.name }
        if has_origin && first_leg.stop_at.nil? && first_leg.name == node.name
          first_leg.stop_at = node.transfer # start_at is already set to origin
        elsif has_destination
          last_legs << Leg.new(my_route.name, node.transfer, destination)
        elsif transfers.exclude?(node.transfer)
          stop_at = node.find_stop_or_default(other_legs[-1].try(:start_at))
          stop_at ||= node.find_stop_or_default(last_legs[-1].try(:start_at), node.transfer)
          start_at = node.find_stop_or_default(first_leg.stop_at, last_transfer)
          other_legs << Leg.new(my_route.name, start_at, stop_at) unless start_at == stop_at
          transfers << node.transfer
        end

        node = node.parent
      end
    end
  end

  # true when origin is a transfer, try to take a different one instead
  def origin_is_transfer_workaround
    if first_leg.start_at == first_leg.stop_at && first_leg.start_at == (other_legs[-1] || last_legs[-1]).start_at
      @first_leg = other_legs.any? ? other_legs.pop : last_legs.pop
    end
  end

  # expects leg to be a NextStop
  def stop_at_location
    latest_leg.stop_at.true_location
  end

  def start_at_location
    first_leg.start_at.true_location
  end

  def same_as?(other)
    first_leg.start_at.time == other.first_leg.start_at.time && start_at_location == other.start_at_location
  end

  def incomplete?(trip)
    !complete?(trip)
  end

  def complete?(trip)
    points.include?(trip.origin) && points.include?(trip.destination)
  end

  def points
    [
        first_leg.start_at.true_location,
        first_leg.stop_at.true_location,
        *other_leg_points,
        last_legs.try(:start_at).try(:true_location),
        last_legs.try(:stop_at).try(:true_location)
    ].uniq
  end

  #
  # = Private
  #

  private

  def other_leg_points
    starts, stops = [], []
    other_legs.compact.each do |ol|
      starts << ol.start_at.try(:true_location)
      stops << ol.stop_at.try(:true_location)
    end
    starts | stops
  end

end