function Islander(bus_stops) {

    this.maui = new Maui();
    this.gmap = new BaseMap();
    this.bus_stops = bus_stops || Locations;
    this.maui.loadBusStops(this.bus_stops); // map location to name

    var isle = this
        , wharf_cinema = this.bus_stops.findObject(this.maui.wharf_cinema, 'name')
        , papalaua_st = this.bus_stops.findObject(this.maui.papalaua_st, 'name')
        , lahaina_cannery_mall = this.bus_stops.findObject(this.maui.lahaina_cannery_mall, 'name')
        , whalers_village = this.bus_stops.findObject(this.maui.whalers_village, 'name')
        , wharf_coords = new google.maps.LatLng(wharf_cinema.lat, wharf_cinema.long);

    this.drawRoute = function () {

        var request = {
            origin: wharf_coords,
            destination: wharf_coords,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: new google.maps.LatLng(papalaua_st.lat, papalaua_st.long)
                },
                {
                    location: new google.maps.LatLng(lahaina_cannery_mall.lat, lahaina_cannery_mall.long)
                },
                {
                    location: new google.maps.LatLng(whalers_village.lat, whalers_village.long)
                },
                {
                    location: new google.maps.LatLng(lahaina_cannery_mall.lat, lahaina_cannery_mall.long)
                },
                {
                    location: new google.maps.LatLng(papalaua_st.lat, papalaua_st.long)
                }
            ]
        };

        this.gmap.directionsService.route(request, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                isle.gmap.directionsDisplay.setDirections(result);
            }
        });
        this.gmap.addMarkers(this.bus_stops, 'Kaanapali Islander #25');
    };
}
// instantiate this function when loaded
(function () {
    var islander = new Islander();
    islander.drawRoute();
})();