require 'leg'
require 'course'

# = Builds out list of possible courses, composed of nodes, legs and direct_routes
# Search all routes that have origin in their stops and then lookup that routes
# -node_map- and search its nodes for the destination. When found, the destination
# node is returned and we build the route by climbing up the node tree, from parent to parent.
# Starts with the first leg of the course, the origin
# finds any inbetween legs, in case of indirect routes, and puts it in other_legs.
# Adds the destinations to the last legs of the course. Filter out dups and try
# to work with legs where the start/stop at are the same. Deal with this issue
# by replacing -first_leg- with a later leg, i.e. -last_legs- || -other_legs-.

class Trip

  attr_accessor :origin, :destination, :courses, :course_options

  def initialize(origin = nil, destination = nil, custom_time = Time.zone.now)
    @origin = origin || 'liholiho_kanaloa_ave'
    @destination = destination || 'queen_kaahumanu'
    @current_time = custom_time
    @courses = []
    @course_options = []
  end

  def plan!
    collect_starting_routes
    collect_course_nodes
    complete_course_legs
    plot_course
    limit_results!
  end

  def collect_starting_routes
    BusData.routes.each do |route|
      stops = route.stops.map(&:true_location).uniq
      if stops.include?(origin)
        course = Course.new(Leg.new(route.name, origin), [], []) # first_leg, last_legs, other_legs
        course.first_leg.stop_at = destination if stops.include?(destination) && course.first_leg.start_at != destination
        course_options << course
      end
    end
    nil
  end

  def collect_course_nodes
    incomplete_course_options.each do |co|
      others = []
      node_map = BusData.node_map[co.first_leg.name]
      while result = node_map.find_by_name(destination, others)
        others << result.name
        co.nodes << result
      end
    end
    nil
  end

  def complete_course_legs
    incomplete_course_options.each do |co|
      co.complete_legs_from_nodes(destination)
      co.origin_is_transfer_workaround
      co.other_legs.reverse!
    end
  end

  # course is complete if first_leg.stop_at is set (in +collect_starting_routes+)
  def incomplete_course_options
    course_options.reject { |co| !co.first_leg.stop_at.nil? }
  end

  def limit_results!(limit=2)
    lcourses = Hash.new(0)
    courses.reject! { |co| (lcourses[co.first_leg.name] += 1) > limit }
  end

  # at this point, -course_options- should be a list of Courses containing Legs
  # afterwards, -courses- should be a list of Courses containing DirectRoutes
  def plot_course
    course_options.each do |course|
      next if course.first_leg.has_same_points?
      find_stops_for(course.first_leg).each do |start_dir_route|
        my_course = Course.new(start_dir_route)
        course.other_legs.each do |leg|
          if leg.start_at == my_course.latest_leg.stop_at.bus_stop.true_location
            my_course.other_legs << find_stops_for(leg, my_course.latest_leg.stop_at.time).sort[0]
          end
        end
        my_course.last_legs = course.last_legs.reject(&:incomplete?).map { |leg|
          if leg.start_at == my_course.stop_at_location
            find_stops_for(leg, my_course.latest_leg.stop_at.time).sort[0]
          end
        }.compact.sort[0]
        unless @courses.find { |c| c.same_as?(my_course) }
          @courses << my_course
        end
      end
    end
  end

  def has_same_points?
    origin == destination
  end

  #
  # = Private Helpers
  #

  private

  def find_stops_for(leg, start_time = nil)
    route = find_route_by_name(leg.name)
    route.find_between(leg.start_at, leg.stop_at, start_time || current_time(route))
  end

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