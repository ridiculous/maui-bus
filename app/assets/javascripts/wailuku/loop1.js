function Loop1(bus_stops) {
    maui.setMapName('Wailuku Loop Route #1');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var piihana_terrace = maui.bus_stops.findObject(maui.piihana_terrace, 'name')
        , piihana_terrace_coords = new google.maps.LatLng(piihana_terrace.lat, piihana_terrace.long)
        , makaala_makamua = maui.bus_stops.findObject(maui.makaala_makamua_st, 'name')
        , makaala_hale_mahaolu = maui.bus_stops.findObject(maui.makaala_hale_mahaolu, 'name')
        , waiehu_heights_aukai = maui.bus_stops.findObject(maui.waiehu_heights_aukai, 'name')
        , waiehu_heights_wailupe = maui.bus_stops.findObject(maui.waiehu_heights_wailupe, 'name')
        , eha_st_sack_n_save = maui.bus_stops.findObject(maui.eha_st_sack_n_save, 'name')
        , wailuku_community_center = maui.bus_stops.findObject(maui.wailuku_community_center, 'name')
        , liholiho_kanaloa_ave = maui.bus_stops.findObject(maui.liholiho_kanaloa_ave, 'name')
        , kanaloa_baseball_field = maui.bus_stops.findObject(maui.kanaloa_baseball_field, 'name')

    maui.drawRoute(maui.gmap.Mall, piihana_terrace_coords,
        [
            'maui_memorial_hospital',
            'maui_lani_parkway',
            'kamole_st_kehalani_sub',
            'ka_hale_ake_ola',
            'state_bldg',
            'ke_ola_health_clinic',
            'wailuku_post_office:stopover',
            'kahekili_terrace'
        ]
    );

    // additional route to complete the map
    if (!maui.centering) {
        maui.gmap.addRoute({
            origin: piihana_terrace_coords,
            destination: maui.gmap.Mall,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: new google.maps.LatLng(makaala_makamua.lat, makaala_makamua.long)
                },
                {
                    location: new google.maps.LatLng(makaala_hale_mahaolu.lat, makaala_hale_mahaolu.long)
                },
                {
                    location: new google.maps.LatLng(waiehu_heights_aukai.lat, waiehu_heights_aukai.long),
                    stopover: false
                },
                {
                    location: new google.maps.LatLng(waiehu_heights_wailupe.lat, waiehu_heights_wailupe.long)
                },
                {
                    location: new google.maps.LatLng(eha_st_sack_n_save.lat, eha_st_sack_n_save.long)
                },
                {
                    location: new google.maps.LatLng(wailuku_community_center.lat, wailuku_community_center.long)
                },
                {
                    location: new google.maps.LatLng(liholiho_kanaloa_ave.lat, liholiho_kanaloa_ave.long)
                },
                {
                    location: new google.maps.LatLng(kanaloa_baseball_field.lat, kanaloa_baseball_field.long)
                }
            ]
        });
    }
}
// instantiate this function when loaded
(function () {
    new Loop1();
})();