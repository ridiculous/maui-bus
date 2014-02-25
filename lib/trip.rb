require 'leg'
require 'course'

# = Builds out list of possible courses, composed of nodes, legs and direct_routes
# Search all routes that have origin in their stops and then lookup that routes
# -node_map- and search its nodes for the destination. When found, the destination
# node is returned and we build the route by climbing up the node tree, from parent to parent.
# Starts with the first leg of the course, the origin
# finds any inbetween legs, in case of indirect routes, and stores it in other_legs.
# Adds the destinations to the last legs of the course. Filter out dups and try
# to work with legs where the start/stop at are the same. Deal with this issue
# by replacing -first_leg- with a later leg, i.e. -last_legs- || -other_legs-.

class Trip

  attr_accessor :origin, :destination, :courses, :course_options

  def initialize(origin = nil, destination = nil, custom_time = nil)
    @origin = origin || 'liholiho_kanaloa_ave'
    @destination = destination || 'queen_kaahumanu'
    @current_time = custom_time || Time.zone.now
    @courses = []
    @course_options = []
  end

  def plan!
    collect_starting_routes
    collect_course_nodes
    complete_course_legs
    plot_course
  end

  # find pertinent routes and create a Course with each one
  def collect_starting_routes
    Bus::Data.routes.each do |route|
      stops = route.locations
      if stops.include?(origin)
        course_options << Course.new(Leg.new(route.name, origin, (destination if stops.include?(destination))))
      end
    end
    nil
  end

  # search the node_map for the destination
  def collect_course_nodes
    incomplete_course_options.each do |co|
      others = []
      node_map = Bus::Data.node_map[co.first_leg.name]
      while result = node_map.find_by_name(destination, others)
        others << result.name
        co.nodes << result
      end
    end
    nil
  end

  # climb the node tree starting from the destination and complete the course legs as we go
  def complete_course_legs
    incomplete_course_options.each do |co|
      co.complete_legs_from_nodes(destination)
      co.origin_is_transfer_workaround
      co.other_legs.reverse!
    end
    nil
  end

  # course is complete if first_leg.stop_at is set (in +collect_starting_routes+)
  def incomplete_course_options
    course_options.reject { |co| !co.first_leg.stop_at.nil? }
  end

  # by route name for origin
  def limit_results!(limit=2)
    lcourses = Hash.new(0)
    courses.reject! { |co| (lcourses[co.first_leg.name] += 1) > limit }
  end

  # at this point, -course_options- should be a list of Courses containing Legs
  # afterwards, -courses- should be a list of Courses containing DirectRoutes
  def plot_course
    course_options.each do |course|
      next if course.first_leg.has_same_points?
      course.first_leg.find_stops(@current_time).each do |start_dir_route|
        my_course = Course.new(start_dir_route)
        course.other_legs.each do |leg|
          if leg.start_at == my_course.stop_at_location
            my_course.other_legs << leg.find_stops(my_course.latest_leg.stop_at.time).sort[0]
          end
        end
        my_course.set_last_leg(course)
        next if my_course.incomplete?(self) || @courses.find { |c| c.same_as?(my_course) }
        @courses << my_course
      end
    end
    nil
  end

  def has_same_points?
    origin == destination
  end

end