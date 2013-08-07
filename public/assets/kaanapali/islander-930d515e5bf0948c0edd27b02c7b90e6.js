function Islander(bus_stops) {

    maui.setMapName('Kaanapali Islander #25');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var wharf_cinema = maui.bus_stops.findObject(maui.wharf_cinema, 'name')
        , wharf_coords = new google.maps.LatLng(wharf_cinema.lat, wharf_cinema.long);

    maui.drawRoute(wharf_coords, wharf_coords,
        [
            'wharf_cinema',
            'papalaua_st',
            'lahaina_cannery_mall',
            'whalers_village'
        ]
    );

}
// instantiate this function when loaded
(function () {
    new Islander();
})();
