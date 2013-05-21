function Islander(bus_stops) {

    maui.setMapName('Haiku Islander Route #35');
    maui.loadBusStops(bus_stops || Locations); // map location to name
    maui.addQueenKaahumanuBack();
    maui.drawRoute(maui.gmap.Mall, maui.gmap.Mall,
        [
            'queen_kaahumanu_back:stopover',
            'kahului_salvation_army',
            'kahului_airport',
            'paia_charleys',
            'haiku_marketplace',
            'haiku_community_center',
            'kahului_airport',
            'queen_kaahumanu_back:stopover'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new Islander();
})();