function Villager(bus_stops) {

    maui.setMapName('Kihei Villager Route #15');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    // locations used for drawing the route
    var start_place = maui.bus_stops.findObject(maui.maalaea_harbor, 'name')
        , destination = maui.bus_stops.findObject(maui.piilani_shopping_center, 'name');

    maui.drawRoute(
        new google.maps.LatLng(start_place.lat, start_place.long),
        new google.maps.LatLng(destination.lat, destination.long),
        // waypoints
        [
            'piikea_south_kihei_across'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new Villager();
})();