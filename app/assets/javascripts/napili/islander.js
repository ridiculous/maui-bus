function Islander(bus_stops) {

    maui.setMapName('Napili Islander Route #30');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var whalers_village = maui.bus_stops.findObject(maui.whalers_village, 'name')
        , whalers_village_coords = new google.maps.LatLng(whalers_village.lat, whalers_village.long);

    maui.drawRoute(whalers_village_coords, whalers_village_coords,
        [
            'kaanapali_beach_club',
            'kuleana',
            'royal_kahana',
            'alaeloa',
            'napili_plaza:stopover',
            'napili_kai',
            'kuleana',
            'kekaa_drive'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new Islander();
})();