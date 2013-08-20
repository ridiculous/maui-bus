var maui = new Maui()
    , Locations = Locations || {};
(function () {
    maui.gmap = new BaseMap({
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoomControlOptions: {
            position: google.maps.ControlPosition.TOP_RIGHT
        },
        panControl: false
    });

    maui.loadBusStops(Locations); // map location to name

    var my_map = maui.gmap.map
        , bubble_html = '<br /><a href="javascript:;" class="origin">Set as Origin</a><br /><a href="javascript:;" class="destination">Set as Destination</a>'
        , addMarkers = function () {
            var markers = [], bus_stops = maui.bus_stops;
            for (var i = 0; i < bus_stops.length; i++) {
                var my_stop = bus_stops[i];
                if (!my_stop.hidden) {
                    var gmap_options = {
                        position: new google.maps.LatLng(my_stop.lat, my_stop.long),
                        map: my_map,
                        title: my_stop.name
                    };
                    markers.push(new SearchMarker(my_stop.key, gmap_options, gmap_options.title + bubble_html));
                }
            }
        };

    addMarkers();
    my_map.setCenter(maui.gmap.Mall);
    my_map.setZoom(my_map.getZoom() + 4);

})();
