function Loop1(bus_stops) {
    maui.setMapName('Wailuku Loop Route #1');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var piihana_terrace_coords = maui.latLngByName('piihana_terrace')
        , makaala_makamua = maui.latLngByName('makaala_makamua_st')
        , makaala_hale_mahaolu = maui.latLngByName('makaala_hale_mahaolu')
        , waiehu_heights_aukai = maui.latLngByName('waiehu_heights_aukai')
        , waiehu_heights_wailupe = maui.latLngByName('waiehu_heights_wailupe')
        , eha_st_sack_n_save = maui.latLngByName('eha_st_sack_n_save')
        , wailuku_community_center = maui.latLngByName('wailuku_community_center')
        , liholiho_kanaloa_ave = maui.latLngByName('liholiho_kanaloa_ave')
        , kanaloa_baseball_field = maui.latLngByName('kanaloa_baseball_field')

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
                    location: makaala_makamua
                },
                {
                    location: makaala_hale_mahaolu
                },
                {
                    location: waiehu_heights_aukai,
                    stopover: false
                },
                {
                    location: waiehu_heights_wailupe
                },
                {
                    location: eha_st_sack_n_save
                },
                {
                    location: wailuku_community_center
                },
                {
                    location: liholiho_kanaloa_ave
                },
                {
                    location: kanaloa_baseball_field
                }
            ]
        });
    }
}
// instantiate this function when loaded
(function () {
    new Loop1();
})();