function CommuterKapalua(bus_stops) {

    maui.setMapName('Kihei-Kapalua Commuter');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var origin = maui.bus_stops.findObject(maui.kilohana_south_kihei, 'name')
        , origin_coords = new google.maps.LatLng(origin.lat, origin.long)
        , destination = maui.bus_stops.findObject(maui.ritz_carlton, 'name')
        , destination_coords = new google.maps.LatLng(destination.lat, destination.long);

    maui.drawRoute(origin_coords, destination_coords,
        [
            'st_theresas_church',
            'kihei_aquatics_center',
            'waipuilani_south_kihei',
            'kaanapali_sheraton',
            'kaanapali_hyatt_regency',
            'kekaa_drive',
            'napili_shores'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new CommuterKapalua();
})();