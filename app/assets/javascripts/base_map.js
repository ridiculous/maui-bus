function BaseMap(options) {
    this.Mall = new google.maps.LatLng(20.886570, -156.475375);

    this.mapOptions = options || {
        zoom: 7,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: this.Mall
    };
    this.map = new google.maps.Map(document.getElementById('map_canvas'), this.mapOptions);
    this.directionsService = new google.maps.DirectionsService();
    this.directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers: true});
    this.directionsDisplay.setMap(this.map);

    this.addMarkers = function (bus_stops, route_name) {
        var markers = [], prefix = route_name ? route_name + "\n" : '';
        for (var i = 0; i < bus_stops.length; i++) {
            if (!bus_stops[i].hidden) {
                var gmap_options = {
                    position: new google.maps.LatLng(bus_stops[i].lat, bus_stops[i].long),
                    map: this.map,
                    title: prefix + bus_stops[i].name
                }, content = gmap_options.title.replace(/\n/, '<br />');
                if (bus_stops[i].times) content += '<br />' + bus_stops[i].times;
                markers.push(new BaseMarker(this.map, gmap_options, content));
            }
        }
        return markers;
    };

    this.connectPoints = function (point_a, point_b) {
        return this.addRoute(
            {
                origin: maui.latLngByName(point_a),
                destination: maui.latLngByName(point_b),
                travelMode: google.maps.TravelMode.DRIVING
            },
            {
                preserveViewport: true
            }
        )
    };

    this.addRoute = function (route_obj, options) {
        var direct_service = new google.maps.DirectionsService(),
            direct_display = new google.maps.DirectionsRenderer({suppressMarkers: true});

        direct_display.setMap(this.map);
        direct_service.route(route_obj, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                if (options) {
                    direct_display.setOptions(options);
                }
                direct_display.setDirections(result);
            }
        });
        return direct_display;
    }
}