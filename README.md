Maui Bus Routes Application
========

A Ruby web app aimed at better organizing the Maui County Bus information. The data is stored in classes for speed and ease of use. Locations have coordinates, which are used in conjunction with Google Maps API V3 to create map markers and draw routes (`DirectionService`). 

Some features:
  1. Search          - click on any bus stop to use it as the origin or destination. Finds direct and indirect routes by joining transfer points
  2. Upcoming Stops  - lists the next 5 (default) stops for each bus on a route
  3. Browser Support - from IE 8 and up to the most recent Chrome
  4. Mobile Support  - responsive and with a need for speed, everything is done with plain JavaScript
  5. Maps            - every route has a map and every bus stop is marked using its coordinates
  6. PDF             - capable of generating a PDF for the bus schedule
