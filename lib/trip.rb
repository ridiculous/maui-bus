require 'leg'
require 'course'

class Trip

  attr_accessor :origin, :destination, :courses, :course_options

  def initialize(origin=nil, destination=nil, custom_time=Time.zone.now)
    @origin = origin || 'liholiho_kanaloa_ave'
    @destination = destination || 'queen_kaahumanu'
    @current_time = custom_time
    @courses = []
    @course_options = []
  end

  # = Builds out list of possible courses, composed of legs
  # starts with the first leg of the course, the origin
  # finds any inbetween legs, in case of indirect routes, and put in other_legs
  # adds the destination to the last leg of the course

  def search_for_courses
    BusData.routes.each do |route|
      transfers_added = []
      stops = route.stops.map(&:true_location).uniq
      if stops.include?(origin)
        # => name, start_at, stop_at
        first_leg = Leg.new(route.name, origin)
        last_leg = Leg.new(nil, nil, destination)
        others = []

        if stops.include?(destination) && first_leg.start_at != destination
          first_leg.stop_at = destination
        else
          # fetch the node map for this route
          node_map = BusData.node_map[route.name]
          node = node_map.find_by_name(destination) # search nodes for destination (always finds it)
          while node
            last_transfer = node.transfer
            has_origin, has_destination = node.stops.include?(origin), node.stops.include?(destination)
            my_route = find_route_by_name(node.name)
            # = first_leg - assign stop_at
            if has_origin && first_leg.stop_at.nil? && first_leg.name == node.name
              first_leg.stop_at = node.transfer
            elsif has_destination && last_leg.start_at.nil?
              # = last_leg - assign name and start_at
              last_leg.name = my_route.name
              last_leg.start_at = node.transfer
            elsif transfers_added.exclude?(node.transfer)
              # = stop_at - assign to start_at of latest -other_legs- || last_leg.start_at || node.transfer
              stop_at = others.any? && node.stops.include?(others[-1].start_at) ? others[-1].start_at : nil
              stop_at ||= last_leg.start_at && node.stops.include?(last_leg.start_at) ? last_leg.start_at : node.transfer
              # = start_at - assign to first_leg.stop_at || last_transfer
              start_at = first_leg.stop_at && node.stops.include?(first_leg.stop_at) ? first_leg.stop_at : last_transfer
              # filter our worthless legs
              unless start_at == stop_at
                others << Leg.new(my_route.name, start_at, stop_at)
              end
              transfers_added.concat([node.transfer])
            end
            node = node.parent
          end
        end
        # true when origin is a transfer, try to take a different one instead
        if first_leg.start_at == first_leg.stop_at && first_leg.start_at == (others[-1] || last_leg).start_at
          if others.any?
            first_leg = others.pop
          else
            first_leg = last_leg
            last_leg.start_at = nil
          end
        end
        # filter out dups
        unless course_options.find { |co| co.first_leg.name == first_leg.name && co.first_leg.start_at == first_leg.start_at }
          course_options << Course.new(first_leg, last_leg, others.reverse)
        end
      end
    end
  end

  def limit_results!(limit=2)
    lcourses = Hash.new(0)
    courses.reject! { |co| (lcourses[co.first_leg.name] += 1) > limit }
  end

  def plot_course
    course_options.each do |course|
      find_stops_for(course.first_leg).each do |start_dir_route|
        my_course = Course.new(start_dir_route)
        course.other_legs.each do |leg|
          my_course.other_legs << find_stops_for(leg, my_course.latest_leg.stop_at.time).sort[0]
        end
        if my_course.other_legs.exclude?(nil)
          if course.last_leg.complete? && (course.other_legs.empty? || my_course.other_legs[-1])
            my_course.last_leg = find_stops_for(course.last_leg, my_course.latest_leg.stop_at.time).sort[0]
          end
          @courses << my_course
        end
      end
    end
  end

  def find_stops_for(leg, start_time = nil)
    route = find_route_by_name(leg.name)
    route.find_between(leg.start_at, leg.stop_at, start_time || current_time(route))
  end

  #
  # = Helpers
  #

  # search morning routes if all routes finished for the day
  def current_time(route)
    if @current_time >= route.last_stop_time
      @current_time - 18.hours
    else
      @current_time
    end
  end

  def find_route_by_name(name)
    BusData.routes.find { |x| x.name == name }
  end

end