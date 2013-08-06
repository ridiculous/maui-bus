function Maui() {

    var mowee = this;

    this.gmap = null;
    this.bus_stops = [];
    this.way_points = [];
    this.map_name = '';
    this.centering = false;

    // creates and assigns attributes for this
    this.loadBusStops = function (buses) {
        if (!this.gmap) this.gmap = new BaseMap();

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
        if (typeof Center !== 'undefined') {
            this.centering = true;
            this.centerMap();
        } else {
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
        }
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
    };

    this.centerMap = function (the_center) {
        var my_center = the_center || this.bus_stops.findObject(this[Center], 'name')
            , coords = new google.maps.LatLng(my_center.lat, my_center.long)
            , base = this.gmap.addMarkers([my_center], this.map_name)[0];

        this.gmap.map.setCenter(coords);
        this.gmap.map.setZoom(this.gmap.map.getZoom() + 11);
        google.maps.event.trigger(base.marker, 'click');
    };

    this.addQueenKaahumanuBack = function () {
        this.bus_stops.push({
            hidden: true,
            lat: 20.884325,
            long: -156.476362,
            location: "queen_kaahumanu_back",
            name: "Back of Queen Kaahumanu"
        });
    };
}
