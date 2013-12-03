require 'spec_helper'
require 'trip'

describe Trip do

  context 'Planning a simple trip' do

    let(:trip) { Trip.new('kahului_airport', 'queen_kaahumanu', Time.zone.parse('12:00 PM')) }

    it 'should find routes and set course_options in collect_starting_routes' do
      trip.collect_starting_routes
      trip.should have(2).course_options
      opt1 = trip.course_options.first
      opt1.should have(0).other_legs
      opt1.should have(0).nodes
      opt1.first_leg.should be_a(Leg)
      opt1.first_leg.name.should == Haiku.islander.name
      opt1.first_leg.start_at.should == "kahului_airport"
      opt1.first_leg.stop_at.should == "queen_kaahumanu"
      opt2 = trip.course_options.last
      opt2.should have(0).other_legs
      opt2.should have(0).nodes
      opt2.first_leg.should be_a(Leg)
      opt2.first_leg.name.should == Upcountry.islander.name
      opt2.first_leg.start_at.should == "kahului_airport"
      opt2.first_leg.stop_at.should == "queen_kaahumanu"
    end

    it 'should collect_course_nodes but exclude these routes, no node map required' do
      trip.collect_starting_routes
      trip.collect_course_nodes
      trip.should have(0).incomplete_course_options
      trip.course_options.each do |co|
        co.should have(0).nodes
      end
    end

    it 'should plot_course after collecting data' do
      trip.collect_starting_routes
      trip.collect_course_nodes
      trip.complete_course_legs
      trip.plot_course
      trip.should have(4).courses
      course1 = trip.courses.first
      course1.should be_a(Course)
      course1.first_leg.should be_a(DirectRoute)
      course1.first_leg.start_at.should be_a(NextStop)
    end

    it 'should plan!, limit, and sort by fastest route' do
      trip.plan!
      trip.should have(4).courses
      trip.courses.map(&:first_leg).map(&:name).uniq.length.should == 2
      trip.courses.each { |c| c.should be_a(Course) }
      sorted_courses = trip.courses.sort
      option1 = sorted_courses[0]
      option1.first_leg.start_at.bus_stop.name.should == "Airport Pick-up Zone #3"
      option1.first_leg.start_at.time.should == Time.zone.parse('12:43:00')
      option1.first_leg.stop_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      option1.first_leg.stop_at.time.should == Time.zone.parse('13:00:00')
      (option1.first_leg.stop_at.time > option1.first_leg.start_at.time).should be_true

      option2 = sorted_courses[1]
      option2.first_leg.start_at.bus_stop.name.should == "Airport Pick-up Zone #3"
      option2.first_leg.start_at.time.should == Time.zone.parse('13:11:00')
      option2.first_leg.stop_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      option2.first_leg.stop_at.time.should == Time.zone.parse('13:30:00')
      (option2.first_leg.stop_at.time > option2.first_leg.start_at.time).should be_true
    end
  end

  context 'Planning a trip with a single transfer' do
    let(:current_time) { Time.zone.parse('13:00:00') }
    let(:trip) { Trip.new('liholiho_kanaloa_ave', 'alana_place_makawao', Time.zone.parse('1:00 PM')) }

    it 'should find routes and set course_options in collect_starting_routes' do
      trip.collect_starting_routes
      trip.should have(2).course_options
      opt1 = trip.course_options.first
      opt1.should have(0).other_legs
      opt1.should have(0).nodes
      opt1.first_leg.should be_a(Leg)
      opt1.first_leg.name.should == "Wailuku Loop Route #1"
      opt1.first_leg.start_at.should == "liholiho_kanaloa_ave"
      opt1.first_leg.stop_at.should be_nil
      opt2 = trip.course_options.last
      opt2.should have(0).other_legs
      opt2.should have(0).nodes
      opt2.first_leg.should be_a(Leg)
      opt2.first_leg.name.should == "Wailuku Loop Route #2 (reverse)"
      opt2.first_leg.start_at.should == "liholiho_kanaloa_ave"
      opt2.first_leg.stop_at.should be_nil
    end

    it 'should collect_course_nodes' do
      trip.collect_starting_routes
      trip.collect_course_nodes
      trip.should have(2).incomplete_course_options
      trip.incomplete_course_options.each do |ico|
        ico.should have(1).nodes
        ico.nodes[0].should be_a(Node)
        ico.nodes[0].name.should == Upcountry.islander.name
      end
    end

    it 'should complete_course_legs' do
      trip.collect_starting_routes
      trip.collect_course_nodes
      trip.complete_course_legs
      trip.should have(2).course_options
      c1 = trip.course_options[0]
      c1.should have(0).other_legs
      c1.should have(1).nodes
      c1.first_leg.name.should == Wailuku.loop_one.name
      c1.first_leg.start_at.should == 'liholiho_kanaloa_ave'
      c1.first_leg.stop_at.should == 'queen_kaahumanu'
      c2 = trip.course_options[1]
      c2.should have(0).other_legs
      c2.should have(1).nodes
      c2.first_leg.name.should == Wailuku.loop_two.name
      c2.first_leg.start_at.should == 'liholiho_kanaloa_ave'
      c2.first_leg.stop_at.should == 'queen_kaahumanu'
      end

    it 'should plan!, limit, and sort by fastest route' do
      trip.plan!
      trip.should have(2).courses
      trip.courses.map(&:first_leg).map(&:name).uniq.length.should == 2
      trip.courses.each { |c| c.should be_a(Course) }
      sorted_courses = trip.courses.sort
      option1 = sorted_courses[0]
      option1.first_leg.start_at.bus_stop.name.should == "Liholiho St. / Kanaloa Ave."
      option1.first_leg.start_at.time.should == Time.zone.parse('1:20 PM')
      option1.first_leg.stop_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      option1.first_leg.stop_at.time.should == Time.zone.parse('1:30 PM')
      option1.last_leg.should be_a(DirectRoute)
      option1.last_leg.start_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      option1.last_leg.start_at.time.should == Time.zone.parse('1:30 PM')
      option1.last_leg.stop_at.bus_stop.name.should == "Alana Place / Makawao Ave"
      option1.last_leg.stop_at.time.should == Time.zone.parse('2:06 PM')

      option2 = sorted_courses[1]
      option2.first_leg.start_at.bus_stop.name.should == "Liholiho St. / Kanaloa Ave. (Parkside)"
      option2.first_leg.start_at.time.should == Time.zone.parse('1:07 PM')
      option2.first_leg.stop_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      option2.first_leg.stop_at.time.should == Time.zone.parse('2:00 PM')
      option2.last_leg.should be_a(DirectRoute)
      option2.last_leg.start_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      option2.last_leg.start_at.time.should == Time.zone.parse('3:00 PM')
      option2.last_leg.stop_at.bus_stop.name.should == "Alana Place / Makawao Ave"
      option2.last_leg.stop_at.time.should == Time.zone.parse('3:36 PM')
    end
  end

  context 'Planning the farthest possible trip' do
    let(:trip) { Trip.new('rice_park', 'napili_kai', Time.zone.parse('1:00 PM')) }

    it 'should find routes and set course_options in collect_starting_routes' do
      trip.collect_starting_routes
      trip.should have(1).course_options
      opt1 = trip.course_options.first
      opt1.should have(0).other_legs
      opt1.should have(0).nodes
      opt1.first_leg.should be_a(Leg)
      opt1.first_leg.name.should == Kula.villager.name
      opt1.first_leg.start_at.should == "rice_park"
      opt1.first_leg.stop_at.should be_nil
    end

    it 'should collect_course_nodes' do
      trip.collect_starting_routes
      trip.course_options.first.should have(0).nodes
      BusData.node_map[trip.course_options.first.first_leg.name].should be_a(NodeMap)
      trip.collect_course_nodes
      trip.course_options.first.should have(1).nodes
      trip.course_options.first.nodes.first.should be_a(Node)
    end

    it 'should complete_course_legs' do
      trip.collect_starting_routes
      trip.collect_course_nodes
      trip.complete_course_legs
      course = trip.course_options.first
      course.first_leg.should be_a(Leg)
      course.first_leg.name.should == Kula.villager.name
      course.first_leg.start_at.should == 'rice_park'
      course.first_leg.stop_at.should == 'pukalani_terrace'
      course.should have(3).other_legs
      course.other_legs.each { |ol| ol.should be_a(Leg) }
      course.other_legs[0].name.should == Upcountry.islander.name
      course.other_legs[0].start_at.should == 'pukalani_terrace'
      course.other_legs[0].stop_at.should == 'queen_kaahumanu'
      course.other_legs[1].name.should == Lahaina.islander.name
      course.other_legs[1].start_at.should == 'queen_kaahumanu'
      course.other_legs[1].stop_at.should == 'wharf_cinema'
      course.other_legs[2].name.should == Kaanapali.islander.name
      course.other_legs[2].start_at.should == 'wharf_cinema'
      course.other_legs[2].stop_at.should == 'whalers_village'
      last_leg = course.instance_variable_get(:@last_legs)[0]
      last_leg.name.should == Napili.islander.name
      last_leg.start_at.should == 'whalers_village'
      last_leg.stop_at.should == 'napili_kai'
    end

    it 'should plot_course, piecing together the legs and returning a completed Course' do
      trip.collect_starting_routes
      trip.collect_course_nodes
      trip.complete_course_legs
      trip.should have(0).courses
      trip.plot_course
      trip.should have(1).courses
      course = trip.courses.first
      course.first_leg.should be_a(DirectRoute)
      course.first_leg.name.should == Kula.villager.name
      course.first_leg.start_at.should be_a(NextStop)
      course.first_leg.start_at.bus_stop.location.should == :rice_park
      course.first_leg.start_at.time.should == Time.zone.parse('1:28 PM')
      course.first_leg.stop_at.should be_a(NextStop)
      course.first_leg.stop_at.bus_stop.location.should == :pukalani_terrace
      course.first_leg.stop_at.time.should == Time.zone.parse('2:00 PM')
      course.should have(3).other_legs
      ol1 = course.other_legs[0]
      ol1.should be_a(DirectRoute)
      ol1.name.should == Upcountry.islander.name
      ol1.start_at.bus_stop.location.should == :pukalani_terrace
      ol1.start_at.time.should == Time.zone.parse('2:00 PM')
      ol1.stop_at.bus_stop.location.should == :queen_kaahumanu
      ol1.stop_at.time.should == Time.zone.parse('3:00 PM')

      ol2 = course.other_legs[1]
      ol2.name.should == Lahaina.islander.name
      ol2.start_at.bus_stop.location.should == :queen_kaahumanu
      ol2.start_at.time.should == Time.zone.parse('3:30 PM')
      ol2.stop_at.bus_stop.location.should == :wharf_cinema
      ol2.stop_at.time.should == Time.zone.parse('4:30 PM')

      ol3 = course.other_legs[2]
      ol3.name.should == Kaanapali.islander.name
      ol3.start_at.bus_stop.location.should == :wharf_cinema
      ol3.start_at.time.should == Time.zone.parse('4:30 PM')
      ol3.stop_at.bus_stop.location.should == :whalers_village
      ol3.stop_at.time.should == Time.zone.parse('5:00 PM')

      course.last_leg.should be_a(DirectRoute)
      course.last_leg.name.should == Napili.islander.name
      course.last_leg.start_at.bus_stop.location.should == :whalers_village
      course.last_leg.start_at.time.should == Time.zone.parse('5:00 PM')
      course.last_leg.stop_at.bus_stop.location.should == :napili_kai
      course.last_leg.stop_at.time.should == Time.zone.parse('5:30 PM')
    end

    it 'should exclude incomplete trips' do
      my_trip = Trip.new('rice_park', 'napili_kai', Time.zone.parse('7:00 PM'))
      my_trip.plan!
      my_trip.should have(1).course_options
      my_trip.should have(0).courses
    end
  end

  context 'Transfer as point of origin' do

    context 'Kahului to Napili' do

      let(:trip) { Trip.new('queen_kaahumanu', 'napili_kai', Time.zone.parse('1:00 PM')) }

      it 'should start by finding all routes stopping at the mall' do
        trip.collect_starting_routes
        trip.should have(8).course_options
        trip.course_options.map(&:first_leg).map(&:name).should ==
            [
                "Haiku Islander Route #35",
                "Kahului Loop Route #5",
                "Kahului Loop Route #6 (reverse)",
                "Kihei Islander Route #10",
                "Lahaina Islander #20",
                "Upcountry Islander #40",
                "Wailuku Loop Route #1",
                "Wailuku Loop Route #2 (reverse)"
            ]
      end

      it 'should plan!' do
        trip.plan!
        trip.should have(8).course_options
        trip.should have(2).courses
        course = trip.courses.sort[0]
        course.first_leg.should be_a(DirectRoute)
        course.first_leg.name.should == Lahaina.islander.name
        course.first_leg.start_at.should be_a(NextStop)
        course.first_leg.start_at.bus_stop.location.should == :queen_kaahumanu
        course.first_leg.start_at.time.should == Time.zone.parse('1:30 PM')
        course.first_leg.stop_at.should be_a(NextStop)
        course.first_leg.stop_at.bus_stop.location.should == :wharf_cinema
        course.first_leg.stop_at.time.should == Time.zone.parse('2:30 PM')
        course.should have(1).other_legs
        other_leg = course.other_legs.first
        other_leg.name.should == Kaanapali.islander.name
        other_leg.start_at.bus_stop.location.should == :wharf_cinema
        other_leg.start_at.time.should == Time.zone.parse('2:30 PM')
        other_leg.stop_at.bus_stop.location.should == :whalers_village
        other_leg.stop_at.time.should == Time.zone.parse('3:00 PM')

        course.last_leg.name.should == Napili.islander.name
        course.last_leg.start_at.bus_stop.location.should == :whalers_village
        course.last_leg.start_at.time.should == Time.zone.parse('3:00 PM')
        course.last_leg.stop_at.bus_stop.location.should == :napili_kai
        course.last_leg.stop_at.time.should == Time.zone.parse('3:30 PM')

        course2 = trip.courses.sort[1]
        course2.first_leg.should be_a(DirectRoute)
        course2.first_leg.name.should == Lahaina.islander.name
        course2.first_leg.start_at.should be_a(NextStop)
        course2.first_leg.start_at.bus_stop.location.should == :queen_kaahumanu
        course2.first_leg.start_at.time.should == Time.zone.parse('2:30 PM')
        course2.first_leg.stop_at.should be_a(NextStop)
        course2.first_leg.stop_at.bus_stop.location.should == :wharf_cinema
        course2.first_leg.stop_at.time.should == Time.zone.parse('3:30 PM')
        course2.should have(1).other_legs
        other_leg = course2.other_legs.first
        other_leg.name.should == Kaanapali.islander.name
        other_leg.start_at.bus_stop.location.should == :wharf_cinema
        other_leg.start_at.time.should == Time.zone.parse('3:30 PM')
        other_leg.stop_at.bus_stop.location.should == :whalers_village
        other_leg.stop_at.time.should == Time.zone.parse('4:00 PM')

        course2.last_leg.name.should == Napili.islander.name
        course2.last_leg.start_at.bus_stop.location.should == :whalers_village
        course2.last_leg.start_at.time.should == Time.zone.parse('4:00 PM')
        course2.last_leg.stop_at.bus_stop.location.should == :napili_kai
        course2.last_leg.stop_at.time.should == Time.zone.parse('4:30 PM')
      end
    end
  end

  context 'Going from the airport to Kula' do
    let(:trip) { Trip.new('kahului_airport', 'kula_hardware', Time.zone.parse('10:00 AM')) }

    it 'should recommend Upcountry Islander #40 as starting route' do
      trip.plan!
      trip.should have(4).courses
      trip.courses.sort!
      trip.limit_results!(1)
      trip.should have(2).courses
      course = trip.courses[0]
      course.should have(0).other_legs
      leg1 = course.first_leg
      leg1.name.should == Upcountry.islander.name
      leg1.start_at.bus_stop.location.should == :kahului_airport
      leg1.start_at.time.should == Time.zone.parse('10:40 AM')
      leg1.stop_at.bus_stop.location.should == :pukalani_terrace
      leg1.stop_at.time.should == Time.zone.parse('11:00 AM')

      leg2 = course.last_leg
      leg2.name.should == Kula.villager.name
      leg2.start_at.bus_stop.location.should == :pukalani_terrace
      leg2.start_at.time.should == Time.zone.parse('11:00 AM')
      leg2.stop_at.bus_stop.location.should == :kula_hardware
      leg2.stop_at.time.should == Time.zone.parse('11:18 AM')
    end
  end
end