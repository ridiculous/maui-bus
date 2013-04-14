function Islander(bus_stops) {

    this.maui = new Maui();
    this.gmap = new BaseMap();
    this.bus_stops = bus_stops || Locations;
    this.maui.loadBusStops(this.bus_stops); // map location to name

    var isle = this
        , back_of_mall = this.bus_stops.findObject(this.maui.queen_kaahumanu_back, 'name')
        , salvation_army = this.bus_stops.findObject(this.maui.kahului_salvation_army, 'name')
        , airport = this.bus_stops.findObject(this.maui.kahului_airport, 'name')
        , paia = this.bus_stops.findObject(this.maui.paia_charleys, 'name')
        , haiku_marketplace = this.bus_stops.findObject(this.maui.haiku_marketplace, 'name')
        , haiku_community_center = this.bus_stops.findObject(this.maui.haiku_community_center, 'name');

    this.drawRoute = function () {

        // NOTE: limited to 8 waypoints with free API
        var request = {
            origin: this.gmap.Mall,
            destination: this.gmap.Mall,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: new google.maps.LatLng(back_of_mall.lat, back_of_mall.long),
                    stopover: false
                },
                {
                    location: new google.maps.LatLng(salvation_army.lat, salvation_army.long)
                },
                {
                    location: new google.maps.LatLng(airport.lat, airport.long)
                },
                {
                    location: new google.maps.LatLng(paia.lat, paia.long)
                },
                {
                    location: new google.maps.LatLng(haiku_marketplace.lat, haiku_marketplace.long)
                },
                {
                    location: new google.maps.LatLng(haiku_community_center.lat, haiku_community_center.long)
                },
                {
                    location: new google.maps.LatLng(airport.lat, airport.long)
                },
                {
                    location: new google.maps.LatLng(back_of_mall.lat, back_of_mall.long),
                    stopover: false
                }
            ]
        };

        this.gmap.directionsService.route(request, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                isle.gmap.directionsDisplay.setDirections(result);
            }
        });
        this.gmap.addMarkers(this.bus_stops, 'Haiku Islander Route #35');
    };
}
// instantiate this function when loaded
(function () {
    var islander = new Islander();
    islander.drawRoute();
})();