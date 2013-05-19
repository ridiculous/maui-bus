function Loop5(bus_stops) {
    maui.setMapName('Kahului Loop Route #5');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var market_place = maui.bus_stops.findObject(maui.maui_market_place, 'name')
        , market_place_coords = new google.maps.LatLng(market_place.lat, market_place.long)
        , kmart = maui.bus_stops.findObject(maui.kmart, 'name')
        , kahului_safeway = maui.bus_stops.findObject(maui.kahului_safeway_across, 'name')
        , kahului_mall = maui.bus_stops.findObject(maui.kahului_shopping_center, 'name')


    maui.drawRoute(maui.gmap.Mall, market_place_coords,
        [
            'maui_college',
            'papa_ave_kea_st',
            'onehee_papa_ave',
            'kahului_community_center',
            'hale_mahaolu_elua',
            'kamehameha_ave_molokai_akua_st',
            'luana_gardens',
            'walmart_back:stopover'
        ]
    );

// additional route to complete the map
    if (!maui.centering) {
        maui.gmap.addRoute({
            origin: market_place_coords,
            destination: maui.gmap.Mall,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: new google.maps.LatLng(kmart.lat, kmart.long)
                },
                {
                    location: new google.maps.LatLng(kahului_safeway.lat, kahului_safeway.long)
                },
                {
                    location: new google.maps.LatLng(kahului_mall.lat, kahului_mall.long)
                },
                {
                    location: new google.maps.LatLng(20.888756, -156.478685)
                }
            ]
        });
    }
}
// instantiate this function when loaded
(function () {
    new Loop5();
})();