function Villager(bus_stops) {

    this.bus_stops = bus_stops || Locations; // locations for creating markers
    Maui.gmap = new BaseMap();
    Maui.loadBusStops(this.bus_stops); // map location to name

    // locations used for drawing the route
    var wharf_cinema = this.bus_stops.findObject(Maui.wharf_cinema, 'name')
        , front_street_505 = this.bus_stops.findObject(Maui.front_street_505, 'name')
        , na_halee = this.bus_stops.findObject(Maui.na_halee, 'name')
        , liloa_hokeo = this.bus_stops.findObject(Maui.liloa_hokeo, 'name')
        , kalena_pikanele_lahaina = this.bus_stops.findObject(Maui.kalena_pikanele_lahaina, 'name')
        , hale_mahaolu_eono = this.bus_stops.findObject(Maui.hale_mahaolu_eono, 'name')
        , lahaina_gateway = this.bus_stops.findObject(Maui.lahaina_gateway, 'name')
        , civic_center = this.bus_stops.findObject(Maui.lahaina_civic_center, 'name')
        , ainakea_malolo = this.bus_stops.findObject(Maui.ainakea_malolo_lahaina, 'name')
        , leialii_parkway = this.bus_stops.findObject(Maui.leialii_parkway_lahaina, 'name')
        , cannery_mall = this.bus_stops.findObject(Maui.lahaina_cannery_mall, 'name')
        , papalaua_st = this.bus_stops.findObject(Maui.papalaua_st, 'name')
        , wharf_coords = new google.maps.LatLng(wharf_cinema.lat, wharf_cinema.long)
        , civic_coords = new google.maps.LatLng(civic_center.lat, civic_center.long)

    // coords to force correct route
        , front_st = new google.maps.LatLng(20.889207, -156.684823)
        , front_st_kenui = new google.maps.LatLng(20.880907, -156.684308)

    this.drawRoute = function () {

        // NOTE: limited to 8 waypoints with free API
        var first_leg = {
            origin: wharf_coords,
            destination: civic_coords,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: new google.maps.LatLng(front_street_505.lat, front_street_505.long)
                },
                {
                    location: new google.maps.LatLng(na_halee.lat, na_halee.long)
                },
                {
                    location: new google.maps.LatLng(liloa_hokeo.lat, liloa_hokeo.long),
                    stopover: false
                },
                {
                    location: new google.maps.LatLng(kalena_pikanele_lahaina.lat, kalena_pikanele_lahaina.long)
                },
                {
                    location: new google.maps.LatLng(hale_mahaolu_eono.lat, hale_mahaolu_eono.long)
                },
                {
                    location: new google.maps.LatLng(lahaina_gateway.lat, lahaina_gateway.long)
                },
                {
                    location: new google.maps.LatLng(ainakea_malolo.lat, ainakea_malolo.long)
                },
                {
                    location: new google.maps.LatLng(leialii_parkway.lat, leialii_parkway.long)
                }
            ]
        }, second_leg = {
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
        };

        Maui.gmap.directionsService.route(first_leg, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                Maui.gmap.directionsDisplay.setDirections(result);
            }
        });
        Maui.gmap.addRoute(second_leg);
        Maui.gmap.addMarkers(this.bus_stops, 'Lahaina Villager #23');
    };
}
// instantiate this function when loaded
(function () {
    var villager = new Villager();
    villager.drawRoute();
})();