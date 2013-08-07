function Loop2(bus_stops) {
    maui.setMapName('Wailuku Loop Route #1');
    maui.loadBusStops(bus_stops || Locations); // map location to name

    var piihana_terrace = maui.bus_stops.findObject(maui.piihana_terrace, 'name')
        , piihana_terrace_coords = new google.maps.LatLng(piihana_terrace.lat, piihana_terrace.long)
        , kahekili_terrace = maui.bus_stops.findObject(maui.kahekili_terrace, 'name')
        , wailuku_post_office = maui.bus_stops.findObject(maui.wailuku_post_office, 'name')
        , ke_ola_health_clinic = maui.bus_stops.findObject(maui.ke_ola_health_clinic, 'name')
        , kamole_st_kehalani_sub = maui.bus_stops.findObject(maui.kamole_st_kehalani_sub, 'name')
        , ka_hale_ake_ola = maui.bus_stops.findObject(maui.ka_hale_ake_ola, 'name')
        , state_bldg = maui.bus_stops.findObject(maui.state_bldg, 'name')
        , maui_memorial_hospital = maui.bus_stops.findObject(maui.maui_memorial_hospital_across, 'name')


    maui.drawRoute(maui.gmap.Mall, piihana_terrace_coords,
        [
            'kanaloa_baseball_field',
            'liholiho_kanaloa_ave_parkside',
            'wailuku_community_center_across',
            'eha_st_sack_n_save',
            'waiehu_heights_aukai:stopover',
            'waiehu_heights_wailupe',
            'makaala_hale_mahaolu',
            'makaala_makamua_st_across'
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
                    location: new google.maps.LatLng(kahekili_terrace.lat, kahekili_terrace.long)
                },
                {
                    location: new google.maps.LatLng(wailuku_post_office.lat, wailuku_post_office.long),
                    stopover: false
                },
                {
                    location: new google.maps.LatLng(ke_ola_health_clinic.lat, ke_ola_health_clinic.long)
                },
                {
                    location: new google.maps.LatLng(kamole_st_kehalani_sub.lat, kamole_st_kehalani_sub.long)
                },
                {
                    location: new google.maps.LatLng(ka_hale_ake_ola.lat, ka_hale_ake_ola.long)
                },
                {
                    location: new google.maps.LatLng(state_bldg.lat, state_bldg.long)
                },
                {
                    location: new google.maps.LatLng(maui_memorial_hospital.lat, maui_memorial_hospital.long),
                    stopover: false
                }
            ]
        });
    }
}
// instantiate this function when loaded
(function () {
    new Loop2();
})();
