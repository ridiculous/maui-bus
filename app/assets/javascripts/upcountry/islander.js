function Islander(bus_stops) {

    maui.setMapName('Upcountry Islander #40');
    maui.loadBusStops(bus_stops || Locations); // map location to name
    maui.drawRoute(maui.gmap.Mall, maui.gmap.Mall,
        [
            'queen_kaahumanu_back',
            'kahului_salvation_army',
            'kahului_airport',
            'pukalani_terrace',
            'makawao_library',
            'haliimaile',
            'kahului_airport',
            'queen_kaahumanu_back'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new Islander();
})();