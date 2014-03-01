function CommuterWailea(bus_stops) {

    maui.setMapName('Haiku-Wailea Commuter');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var origin = maui.bus_stops.findObject(maui.haiku_community_center, 'name')
        , origin_coords = new google.maps.LatLng(origin.lat, origin.long)
        , destination = maui.bus_stops.findObject(maui.makena, 'name')
        , destination_coords = new google.maps.LatLng(destination.lat, destination.long)

    maui.drawRoute(origin_coords, destination_coords,
        [
            'paia_community_center',
            'war_memorial',
            'kuihelani_park_ride',
            'piilani_shopping_center'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new CommuterWailea();
})();