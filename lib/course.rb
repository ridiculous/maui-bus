require 'leg'

class Course
  attr_accessor :first_leg, :last_leg, :other_legs, :nodes

  class Legs < Array
    def completed
      reject { |a| a.incomplete? }
    end
  end

  def initialize(first_leg = nil, last_legs = [], others = [])
    @first_leg = first_leg
    @last_leg = nil
    @last_legs = Legs.new(last_legs)
    @other_legs = others
    @nodes = []
  end

  def leg_length
    1 + other_legs.length + (last_leg ? 1 : 0)
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
        first_leg.stop_at || set_first_leg_stop(node)
        if node.stops.include?(destination)
          @last_legs << Leg.new(node.name, node.transfer, destination)
        elsif transfers.exclude?(node.transfer)
          add_to_other_legs(node)
          transfers << node.transfer
        end
        node = node.parent
      end
    end
  end

  # true when origin is a transfer, try to take a different one instead
  def origin_is_transfer_workaround
    if first_leg.start_at == first_leg.stop_at && first_leg.start_at == (other_legs[-1] || @last_legs[-1]).start_at
      @first_leg = other_legs.any? ? other_legs.pop : @last_legs.pop
    end
  end

  def latest_leg
    other_legs[-1] || first_leg
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
    ([trip.origin, trip.destination] - start_and_stop_points).empty?
  end

  def stopping_points
    [
        starting_points,
        *middle_points,
        ending_points
    ]
  end

  def start_and_stop_points
    [*starting_points, *ending_points].uniq
  end

  def completed_last_legs
    @last_legs.completed
  end

  def set_last_leg(other_course)
    latest_time = latest_leg.stop_at.time
    @last_leg = other_course.completed_last_legs.map { |leg|
      leg.find_stops(latest_time).sort[0] if leg.start_at == stop_at_location
    }.compact.sort[0]
  end

  def start_at
    first_leg.start_at.time
  end

  def stop_at
    (last_leg || other_legs[-1] || first_leg).stop_at.time
  end

  def time
    stop_at - start_at
  end

  def legs
    (other_legs + [last_leg]).compact
  end

  private

  # start_at is already set to origin
  def set_first_leg_stop(node)
    has_origin = node.stops.include?(first_leg.start_at) || node.stops.include?(node.transfer)

    if has_origin && first_leg.route.locations.include?(node.transfer)
      first_leg.stop_at = node.transfer
    end
  end

  def add_to_other_legs(node)
    stop_at = node.find_stop_or_default(other_legs[-1].try(:start_at))
    stop_at ||= node.find_stop_or_default(@last_legs[-1].try(:start_at), node.transfer)
    start_at = node.find_stop_or_default(first_leg.stop_at, node.transfer)
    other_legs << Leg.new(node.name, start_at, stop_at) unless start_at == stop_at
  end

  def starting_points
    [start_at_location, first_leg.stop_at.true_location]
  end

  def middle_points
    other_legs.map { |ol| [ol.start_at.true_location, ol.stop_at.true_location] }
  end

  def ending_points
    [last_leg.try(:start_at).try(:true_location), last_leg.try(:stop_at).try(:true_location)].compact
  end

end