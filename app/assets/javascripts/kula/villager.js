function Villager(bus_stops) {


    maui.setMapName('Kula Villager Route #39');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var pukalani = maui.bus_stops.findObject(maui.pukalani_terrace, 'name')
        , origin_coords = new google.maps.LatLng(pukalani.lat, pukalani.long);

    maui.drawRoute(origin_coords, origin_coords,
        [
            'longs_pukalani',
            'waimele_place_kula',
            'lower_kimo_drive',
            'kula_community_center',
            'rice_park',
            'kula_community_center',
            'lower_kimo_drive'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new Villager();
})();