function Maui() {

    var mowee = this;

    this.gmap = null;
    this.bus_stops = [];
    this.way_points = [];
    this.map_name = '';

    // creates and assigns attributes for this
    this.loadBusStops = function (buses) {
        if (!this.gmap) {
            this.gmap = new BaseMap();
        }

        this.bus_stops = buses;

        for (var i = 0; i < buses.length; i++) {
            this[buses[i]['location']] = buses[i]['name'];
        }
    };

    /**
     *
     * @param origin (google.maps.LatLng)
     * @param destination (google.maps.LatLng)
     * @param waypoints (Array)
     */
    this.drawRoute = function (origin, destination, waypoints) {

        this.setWayPoints(waypoints);

        var request = {
            origin: origin,
            destination: destination,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: this.way_points
        };

        this.gmap.directionsService.route(request, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                mowee.gmap.directionsDisplay.setDirections(result);
            }
        });
        this.gmap.addMarkers(this.bus_stops, this.map_name);
    };

    this.setWayPoints = function (waypoints) {
        for (var i = 0; i < waypoints.length; i++) {

            var my_stop = null
                , way_opts = {};

            if (waypoints[i] && /:stopover/.test(waypoints[i])) {
                my_stop = this.bus_stops.findObject(waypoints[i].split(':')[0], 'location');
                way_opts.stopover = false;
            } else {
                my_stop = this.bus_stops.findObject(waypoints[i], 'location')
            }
            way_opts.location = new google.maps.LatLng(my_stop.lat, my_stop.long);
            this.way_points[i] = way_opts;
        }
    };

    this.setMapName = function (name) {
        this.map_name = name;
    }
}
