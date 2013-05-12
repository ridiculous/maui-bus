function Villager(bus_stops) {

    maui.setMapName('Lahaina Villager #23');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    // locations used for drawing the route
    var wharf_cinema = maui.bus_stops.findObject(maui.wharf_cinema, 'name')
        , civic_center = maui.bus_stops.findObject(maui.lahaina_civic_center, 'name')
        , cannery_mall = maui.bus_stops.findObject(maui.lahaina_cannery_mall, 'name')
        , papalaua_st = maui.bus_stops.findObject(maui.papalaua_st, 'name')
        , wharf_coords = new google.maps.LatLng(wharf_cinema.lat, wharf_cinema.long)
        , civic_coords = new google.maps.LatLng(civic_center.lat, civic_center.long)

    // coords to force correct route
        , front_st = new google.maps.LatLng(20.889207, -156.684823)
        , front_st_kenui = new google.maps.LatLng(20.880907, -156.684308);

    // can only add a max of 8 waypoints per google.maps.DirectionsService
    maui.drawRoute(wharf_coords, civic_coords,
        [
            'front_street_505',
            'na_halee',
            'liloa_hokeo',
            'kalena_pikanele_lahaina',
            'hale_mahaolu_eono',
            'lahaina_gateway',
            'ainakea_malolo_lahaina',
            'leialii_parkway_lahaina'
        ]
    );

    // additional route to complete the map
    if (!maui.centering) {
        maui.gmap.addRoute({
            origin: civic_coords,
            destination: wharf_coords,
            travelMode: google.maps.TravelMode.DRIVING,
            avoidHighways: true,
            waypoints: [
                {
                    location: front_st
                },
                {
                    location: new google.maps.LatLng(cannery_mall.lat, cannery_mall.long)
                },
                {
                    location: front_st_kenui
                },
                {
                    location: new google.maps.LatLng(papalaua_st.lat, papalaua_st.long)
                }
            ]
        });
    }
}
// instantiate this function when loaded
(function () {
    new Villager();
})();