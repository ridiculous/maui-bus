function Islander(bus_stops) {

    maui.setMapName('Kihei Islander Route #10');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    // locations used for drawing the route
    var destination = maui.bus_stops.findObject(maui.wailea_ike, 'name');

    maui.drawRoute(
        maui.gmap.Mall,
        new google.maps.LatLng(destination.lat, destination.long),
        // waypoints
        [
            'kahului_salvation_army',
            'uwapo_south_kihei',
            'piikea_south_kihei_across',
            'piilani_shopping_center',
            'lipoa_liloa',
            'welakahao_south_kihei',
            'kamaole_shopping_center'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new Islander();
})();