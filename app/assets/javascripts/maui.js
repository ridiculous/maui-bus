function Maui() {

    this.gmap = null;

    // creates and assigns attributes for this
    this.loadBusStops = function (bus_stops) {
        for (var i = 0; i < bus_stops.length; i++) {
            this[bus_stops[i]['location']] = bus_stops[i]['name'];
        }
    }
}