function Villager(bus_stops) {

    this.maui = new Maui();
    this.gmap = new BaseMap();
    this.bus_stops = bus_stops || Locations;
    this.maui.loadBusStops(this.bus_stops); // map location to name

    var village = this
        , pukalani = this.bus_stops.findObject(this.maui.pukalani_terrace, 'name')
        , origin_coords = new google.maps.LatLng(pukalani.lat, pukalani.long)
        , longs_pukalani = this.bus_stops.findObject(this.maui.longs_pukalani, 'name')
        , waimele_place_kula = this.bus_stops.findObject(this.maui.waimele_place_kula, 'name')
        , lower_kimo_drive = this.bus_stops.findObject(this.maui.lower_kimo_drive, 'name')
        , kula_community_center = this.bus_stops.findObject(this.maui.kula_community_center, 'name')
        , rice_park = this.bus_stops.findObject(this.maui.rice_park, 'name');

    this.drawRoute = function () {

        // NOTE: limited to 8 waypoints with free API
        var request = {
            origin: origin_coords,
            destination: origin_coords,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: new google.maps.LatLng(longs_pukalani.lat, longs_pukalani.long)
                },
                {
                    location: new google.maps.LatLng(waimele_place_kula.lat, waimele_place_kula.long)
                },
                {
                    location: new google.maps.LatLng(lower_kimo_drive.lat, lower_kimo_drive.long)
                },
                {
                    location: new google.maps.LatLng(kula_community_center.lat, kula_community_center.long)
                },
                {
                    location: new google.maps.LatLng(rice_park.lat, rice_park.long)
                },
                {
                    location: new google.maps.LatLng(kula_community_center.lat, kula_community_center.long)
                },
                {
                    location: new google.maps.LatLng(lower_kimo_drive.lat, lower_kimo_drive.long)
                }
            ]
        };

        this.gmap.directionsService.route(request, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                village.gmap.directionsDisplay.setDirections(result);
            }
        });
        this.gmap.addMarkers(this.bus_stops, 'Kula Villager Route #39');
    };
}
// instantiate this function when loaded
(function () {
    var kula = new Villager();
    kula.drawRoute();
})();