function CommuterKapalua(bus_stops) {

    maui.setMapName('Makawao-Kapalua Commuter');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var origin = maui.bus_stops.findObject(maui.eddie_tam_gym, 'name')
        , origin_coords = new google.maps.LatLng(origin.lat, origin.long)
        , destination = maui.bus_stops.findObject(maui.ritz_carlton, 'name')
        , destination_coords = new google.maps.LatLng(destination.lat, destination.long);

    maui.drawRoute(origin_coords, destination_coords,
        [
            'pukalani_community_center',
            'war_memorial',
            'maui_eldorado',
            'kaanapali_sheraton',
            'kaanapali_beach_hotel',
            'kaanapali_hyatt_regency',
            'napili_shores'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new CommuterKapalua();
})();