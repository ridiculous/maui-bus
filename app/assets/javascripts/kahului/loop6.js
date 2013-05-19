function Loop6(bus_stops) {
    maui.setMapName('Kahului Loop Route #6 (reverse)');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var onehee_papa_ave = maui.bus_stops.findObject(maui.onehee_papa_ave_across, 'name')
        , onehee_papa_ave_coords = new google.maps.LatLng(onehee_papa_ave.lat, onehee_papa_ave.long)
        , papa_ave_kea = maui.bus_stops.findObject(maui.papa_ave_kea_across, 'name')
        , uhmc = maui.bus_stops.findObject(maui.maui_college, 'name')


    maui.drawRoute(maui.gmap.Mall, onehee_papa_ave_coords,
        [
            'kahului_shopping_center',
            'kahului_safeway',
            'kmart',
            'maui_market_place',
            'walmart_across',
            'west_papa_lanai_st_across',
            'kamehameha_ave_molokai_akua_st_across',
            'hale_mahaolu_elua'
        ]
    );

    // additional route to complete the map
    if (!maui.centering) {
        maui.gmap.addRoute({
            origin: onehee_papa_ave_coords,
            destination: maui.gmap.Mall,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: new google.maps.LatLng(papa_ave_kea.lat, papa_ave_kea.long)
                },
                {
                    location: new google.maps.LatLng(uhmc.lat, uhmc.long)
                }
            ]
        });
    }
}
// instantiate this function when loaded
(function () {
    new Loop6();
})();