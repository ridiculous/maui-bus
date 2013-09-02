Maui Bus Routes Application
========

A Ruby web app aimed at better organizing the Maui County Bus information. The data is stored in classes for speed and ease of use. Locations have coordinates, which are used in conjunction with Google Maps API V3 to create map markers and draw routes. Responsive and optimized for mobile devices.

See it in action at [mauibus.net](http://mauibus.net)

Features
========

  1. __Search__          - click on any bus stop to use it as the origin or destination. Finds direct and indirect routes by joining transfer points
  2. __Upcoming Stops__  - lists the next 5 (default) stops for each bus on a route
  3. __Browser Support__ - from IE 8 and up to the most recent Chrome
  4. __Mobile Support__  - responsive and with a need for speed, everything is done with plain JavaScript
  5. __Maps__            - every route has a map and every bus stop is marked using its coordinates
  6. __PDF__             - capable of generating a PDF for the bus schedule

Documentation
=========

Its not what you say, its what you can prove. That's why we have automated tests :) I like the RSpec testing framework, so thats what the tests, or "specs," are written in.

Run `rspec . -fs` from the repo root and the output should be something like:

    
    SearchController
      GET index
        should render index view in map_hybrid layout
        should not find routes when origin == destination
        should render partial when request is AJAX
        should find routes
    
    BusRoute
      Finders
        should find_between point_a and point_b at current_time
        should find upcoming stops for a given time (default now)
        should find next stops for each bus on the route
        should find the last time for a route
      Helpers
        class_name should be the instance's class name
        full_class_name should be instance and parent class name joined w/ underscore
        transfer_locations should be unique transfer locations as Array
    
    NodeMap
      Wailuku
        should find a bus stop using the node map
    
    RegionsController
      GET index
        should show all regions
      GET schedule
        should load info for all regions
      GET show
        should find the route by name
        should redirect to root path when region not found
    
    BusRoutesController
      GET show_map
        should find the route and load its map
    
    BusStop
      Helpers
        should find upcoming times with valid params
        should sort list of times in military format and convert to TimeWithZone
        should find upcoming times without params (default now)
        true_location should remove the terms 'across', 'makai', 'parkside'
        should sort list of times for an instance
    
    Trip
      Planning a simple trip
        should find routes and set course_options in collect_starting_routes
        should plot_course after collecting data
        should plan!, limit, and sort by fastest route
        should collect_course_nodes but exclude these routes, no node map required
      Planning the farthest possible trip
        should find routes and set course_options in collect_starting_routes
        should complete_course_legs
        should plot_course, piecing together the legs and returning a completed Course
        should collect_course_nodes
      Transfer as point of origin
        Kahului to Napili
          should start by finding all routes stopping at the mall
          should plan! (takes awhile)
        A late night in town
          should start by finding all routes stopping at the mall
          should plan! ... for tomorrow, 'cause its late
      Planning a trip with a single transfer
        should find routes and set course_options in collect_starting_routes
        should complete_course_legs
        should plan!, limit, and sort by fastest route
        should collect_course_nodes
    
    Finished in 6.22 seconds
    38 examples, 0 failures
      
If you are looking for an API, please let me know and I'll get motivated to make it happen.
