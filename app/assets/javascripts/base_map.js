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

    this.addMarkers = function (route_name) {
        for (var i = 0; i < Locations.length; i++) {
            var marker_info = {
                position: new google.maps.LatLng(Locations[i].lat, Locations[i].long),
                map: this.map,
                title: route_name + "\n" + Locations[i].name + "\n" + Locations[i].times
            };
            new BaseMarker(this.map, marker_info);
        }
    };
}