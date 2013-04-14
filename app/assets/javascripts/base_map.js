function BaseMap() {
    this.Mall = new google.maps.LatLng(20.886570, -156.475375);
    this.directionsDisplay = null;
    this.directionsService = new google.maps.DirectionsService();
    this.directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers: true});
    this.mapOptions = {
        zoom: 7,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: this.Mall
    };
    this.map = new google.maps.Map(document.getElementById('map_canvas'), this.mapOptions);
    this.directionsDisplay.setMap(this.map);

    this.addMarkers = function (bus_stops, route_name) {
        for (var i = 0; i < bus_stops.length; i++) {
            if (!bus_stops[i].hidden) {
                new BaseMarker(this.map, {
                    position: new google.maps.LatLng(bus_stops[i].lat, bus_stops[i].long),
                    map: this.map,
                    title: route_name + "\n" + bus_stops[i].name + "\n" + bus_stops[i].times
                });
            }
        }
    };
}