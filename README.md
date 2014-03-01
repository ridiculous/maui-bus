Maui Bus Routes Application
========

[![Code Climate](https://codeclimate.com/github/ridiculous/maui-bus.png)](https://codeclimate.com/github/ridiculous/maui-bus)

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

    BusRoute
      Finders
        should find_between point_a and point_b at current_time
        should find upcoming stops for a given time (default now)
        should find next stops for each bus on the route
      Helpers
        class_name should be the instance's class name
        full_class_name should be instance and parent class name joined w/ underscore
        transfer_locations should be unique transfer locations as Array

    BusStop
      Helpers
        true_location should remove the terms 'across', 'makai', 'parkside'
        should find upcoming times without params (default now)
        should find upcoming times with valid params
        should sort list of times in military format and convert to TimeWithZone
        should sort list of times for an instance

    Region
      Time management with JavaScript
        should toggle times
        should filter times by time-frame (morning and evening)
        should start with appropriate default time-frame

    Schedule
      Time management with JavaScript
        should request bus times asynchronously and add to DOM
        should toggle times
        should filter times by time-frame (morning and evening)
        should start with appropriate default time-frame

    NodeMap
      Wailuku
        should find a bus stop using the node map

    Trip
      Planning a simple trip
        should find routes and set course_options in collect_starting_routes
        should collect_course_nodes but exclude these routes, no node map required
        should plot_course after collecting data
        should plan!, limit, and sort by fastest route
      Planning a trip with a single transfer
        should find routes and set course_options in collect_starting_routes
        should collect_course_nodes
        should complete_course_legs
        should plan!, limit, and sort by fastest route
      Planning the farthest possible trip
        should find routes and set course_options in collect_starting_routes
        should collect_course_nodes
        should complete_course_legs
        should plot_course, piecing together the legs and returning a completed Course
        should exclude incomplete trips
      Transfer as point of origin
        Kahului to Napili
          should start by finding all routes stopping at the mall
          should plan!
      Going from the airport to Kula
        should recommend Upcountry Islander #40 as starting route

    Finished in 18.4 seconds
    44 examples, 0 failures
      
If you are looking for an API, please let me know and I'll get motivated to make it happen.
