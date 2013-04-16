function Islander(bus_stops) {

    this.maui = new Maui();
    this.gmap = new BaseMap();
    this.bus_stops = bus_stops || Locations;
    this.maui.loadBusStops(this.bus_stops); // map location to name

    var isle = this
        , wharf_cinema = this.bus_stops.findObject(this.maui.wharf_cinema, 'name')
        , state_bldg_wells_st = this.bus_stops.findObject(this.maui.state_bldg_wells_st, 'name')
        , maalaea_harbor = this.bus_stops.findObject(this.maui.maalaea_harbor, 'name')
        , state_bldg = this.bus_stops.findObject(this.maui.state_bldg, 'name');

    this.drawRoute = function () {

        var request = {
            origin: isle.gmap.Mall,
            destination: isle.gmap.Mall,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: new google.maps.LatLng(state_bldg_wells_st.lat, state_bldg_wells_st.long)
                },
                {
                    location: new google.maps.LatLng(maalaea_harbor.lat, maalaea_harbor.long)
                },
                {
                    location: new google.maps.LatLng(wharf_cinema.lat, wharf_cinema.long)
                },
                {
                    location: new google.maps.LatLng(maalaea_harbor.lat, maalaea_harbor.long)
                },
                {
                    location: new google.maps.LatLng(state_bldg.lat, state_bldg.long)
                }
            ]
        };

        this.gmap.directionsService.route(request, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                isle.gmap.directionsDisplay.setDirections(result);
            }
        });
        this.gmap.addMarkers(this.bus_stops, 'Lahaina Islander #20');
    };
}
// instantiate this function when loaded
(function () {
    var islander = new Islander();
    islander.drawRoute();
})();