function Islander(bus_stops) {
    maui.setMapName('Lahaina Islander #20');
    maui.loadBusStops(bus_stops || Locations); // map location to name
    maui.drawRoute(maui.gmap.Mall, maui.gmap.Mall,
        [
            'state_bldg_wells_st',
            'maalaea_harbor',
            'wharf_cinema',
            'maalaea_harbor',
            'state_bldg'
        ]
    );
}
// instantiate this function when loaded
(function () {
    new Islander();
})();
