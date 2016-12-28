Maui Bus Routes Application
========

[![Code Climate](https://codeclimate.com/github/ridiculous/maui-bus/badges/gpa.svg)](https://codeclimate.com/github/ridiculous/maui-bus)

A Ruby web app aimed at better organizing the Maui County Bus information. The data is stored as Ruby constants in a "node map," which is created at boot time for speed and usabiity. Locations have coordinates, which are used in conjunction with Google Maps API V3 to create map markers and draw routes. Responsive and optimized for mobile devices.

See it in action at [mauibus.net](http://mauibus.net)

Features
========

  1. __Search__          - click on any bus stop to use it as the origin or destination. Finds direct and indirect routes by joining transfer points
  2. __Upcoming Stops__  - lists the next 5 (default) stops for each bus on a route
  3. __Browser Support__ - from IE 8 and up to the most recent Chrome
  4. __Mobile Support__  - responsive and with a need for speed, everything is done with plain JavaScript
  5. __Maps__            - every route has a map and every bus stop is marked using its coordinates
  6. __PDF__             - capable of generating a PDF for the bus schedule

TODO
=========

Allow visitors to sign up for a user account that enables them to submit feedback on which routes, stops and
times they commonly use. Also allow them to say whether or not the bus was on time.

Documentation
=========

Its not what you say, its what you can prove. That's why we have automated tests :) I like the RSpec testing framework and have a few JavaScript specs using Capybara.

Run `rspec . -fs` from the repo root and the output should be something like:

    
    BusRoutesController
      GET show_map
        should find the route and load its map

    RegionsController
      GET index
        should show all regions
      GET schedule
        should load info for all regions
      GET show
        should find the route by name
        should redirect to root path when region not found

    SearchController
      GET index
        should render index view in map_hybrid layout
        should find routes
        should not find routes when origin == destination
        should respond with a partial when requested via AJAX

    Bus::NodeMap
      Wailuku
        should find a bus stop using the node map

    Bus::Operator
      Kaanapali
        Islander
          should #bus_active?
          should not be #bus_active?
          should #bus_about_active?
          should not be #bus_about_active?
          should #no_delay?
          should be #delayed_bus?
      Kihei
        Islander
          should be #no_delay?
          should get #upcoming_stops for a single bus
          should #find_between point_a and point_b at current_time
          total_buses
            should == 2
          route
            should equal #<Kihei::Islander:0x007fc56edd8430 @name="Kihei Islander Route #10", @stops=[...], @operator=#<struct Bus::Operator route=#<Kihei::Islander:0x007fc56edd8430 ...>, total_buses=2, options={}>>
        Villager
          should find upcoming stops for a given time (default now)
          total_buses
            should == 1
          route
            should equal #<Kihei::Villager:0x007fc56c0a1660 @name="Kihei Villager Route #15", @stops=[...], @operator=#<struct Bus::Operator route=#<Kihei::Villager:0x007fc56c0a1660 ...>, total_buses=1, options={}>>

    Bus::Route
      class methods
        should #load_stops for a bus route
      child class
        should have an operator
        should delegate to the operator
        should know where it stops_at?
        class_name
          should == "islander"
        full_class_name
          should == "lahaina_islander"
        path_parts
          should == ["lahaina", "islander"]
        underscore_name
          should == "lahaina/islander"
        locations
          should == ["queen_kaahumanu", "state_bldg_wells_st", "waikapu", "maalaea_harbor", "wharf_cinema", "maalaea_harbor", "waikapu", "state_bldg", "queen_kaahumanu"]
        transfer_locations
          should == ["queen_kaahumanu", "maalaea_harbor", "wharf_cinema"]
        max_stop_length
          should == 15
        caching #next_stops
          should load cache when #next_stops_cache is empty
          should use cache when present

    Bus::Stop
      Helpers
        true_location should remove the terms 'across', 'makai', 'parkside'
        should find upcoming times without params (default now)
        should find upcoming times with valid params
        should sort list of times in military format and convert to TimeWithZone
        should sort list of times for an instance

    Course
      legs
        should combine last and others into legs
      #time
        when last_leg is nil
          should calculate the travel time with first_leg.stop_at
          should calculate the travel time with other_legs if present
        when last_leg present
          should calculate the travel time with last_leg.stop_at

    Detail
      lat
        should == 20.88657
      long
        should == -156.475375
      name
        should == "Queen Kaahumanu Mall"
      zip
        should == 96732
      transfer
        should == true
      transfer?
        should == true
      coords
        should == "20.88657,-156.475375"
      to_s
        should == "Kahului - Queen Kaahumanu Mall"
      #distance_to
        should return distance in miles to another point

    Location
      #find
        should return the location details
        should be aliased to []
      #all
        should return all locations
      #unique
        should reject locations ending with "across"
        should reject locations ending with "parkside"
        should reject locations ending with "makai"
        should reject locations ending with "mauka"
      #find_with_coordinates
        should find stops within the threshold
        should be sorted by closest bus stop
        should return an empty array when nothing found
        length
          should == 4
        first
          should be a kind of Location::Nearby

    Trip
      Planning a simple trip
        should find routes and set course_options in collect_starting_routes
        should collect_course_nodes but exclude these routes, no node map required
        should plot_course after collecting data
        should plan, limit, and sort by fastest route
      Planning a trip with a single transfer
        should find routes and set course_options in collect_starting_routes
        should collect_course_nodes
        should complete_course_legs
        should plan, limit, and sort by fastest route
      Planning the farthest possible trip
        should find routes and set course_options in collect_starting_routes
        should collect_course_nodes
        should complete_course_legs
        should plot_course, piecing together the legs and returning a completed Course
        should exclude incomplete trips
      Transfer as point of origin
        Kahului to Napili
          should start by finding all routes stopping at the mall
          should plan
      Going from the airport to Kula
        should recommend Upcountry Islander #40 as starting route

    Region
      Time management with JavaScript
        desktop
          should toggle times
          should filter times by time-frame (morning and evening)
          should start with appropriate default time-frame
        mobile
          should filter times by time-frame (morning, afternoon, and evening)

    Schedule
      Time management with JavaScript
        should request bus times asynchronously and add to DOM
        should toggle times
        should filter times by time-frame (morning and evening)
        should start with appropriate default time-frame

    Finished in 34.68 seconds
    91 examples, 0 failures
      
If you are looking for an API, please let me know and I'll get motivated to make it happen.
