function Islander() {
    var isle = this;

    this.gmap = new BaseMap();
    var back_of_mall = new google.maps.LatLng(Locations[0].lat, Locations[0].long)
        , salvation_army = new google.maps.LatLng(Locations[1].lat, Locations[1].long)
        , airport = new google.maps.LatLng(Locations[2].lat, Locations[2].long)
        , paia = new google.maps.LatLng(Locations[3].lat, Locations[3].long)
        , haiku_marketplace = new google.maps.LatLng(Locations[4].lat, Locations[4].long)
        , haiku_community_center = new google.maps.LatLng(Locations[5].lat, Locations[5].long);

    this.drawRoute = function () {

        // NOTE: limited to 8 waypoints with free API
        var request = {
            origin: this.gmap.Mall,
            destination: this.gmap.Mall,
            travelMode: google.maps.TravelMode.DRIVING,
            waypoints: [
                {
                    location: back_of_mall,
                    stopover: false
                },
                {
                    location: salvation_army
                },
                {
                    location: airport
                },
                {
                    location: paia
                },
                {
                    location: haiku_marketplace
                },
                {
                    location: haiku_community_center
                },
                {
                    location: airport
                },
                {
                    location: back_of_mall,
                    stopover: false
                }
            ]
        };

        this.gmap.directionsService.route(request, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                isle.gmap.directionsDisplay.setDirections(result);
            }
        });
        this.gmap.addMarkers();
    };
}
(function () {
    var islander = new Islander();
    islander.drawRoute();
})();