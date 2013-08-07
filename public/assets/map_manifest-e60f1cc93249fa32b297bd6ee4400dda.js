/**
 * Kind of like ruby's 3.times do .. end method
 * usage: (3).timesDo(function() {} );
 *
 * @param callback {function} to be called however many times
 */

Number.prototype.timesDo = function (callback) {
    if (callback) {
        for (var i = 0; i < this; i++) {
            callback.call();
        }
    }
};

String.prototype.squeeze = function () {
    return this.replace(/\s+/g, '');
};

String.prototype.pluralize = function (count) {
    var plural = 's';
    if (count == 1) plural = '';
    return this + plural;

};

//
// Array extensions
//
Array.prototype.compacted = function () {
    var tmp = [];
    for (var i = 0; i < this.length; i++) {
        if (this[i] !== undefined && this[i] !== null && this[i] !== false) {
            tmp.push(this[i]);
        }
    }
    return tmp;
};

Array.prototype.find = function (value) {
    var found = -1;
    for (var i = 0; i < this.length; i++) {
        if (this[i] == value) {
            found = i;
        }
    }
    return found;
};

Array.prototype.findObject = function (value, key) {
    var my_obj = null;
    for (var i = 0; i < this.length; i++) {
        if (this[i][key] == value) {
            my_obj = this[i];
        }
    }
    return my_obj;
};

Array.prototype.updateObject = function (id, key, value_key, value) {
    for (var i = 0; i < this.length; i++) {
        if (this[i][key] == value) {
            return this[i][value_key] = value;
        }
    }
};

Array.prototype.findAndRemove = function (value) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == value) {
            this.splice(i, 1);
        }
    }
};

Array.prototype.findAndRemoveObject = function (value, key) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] && this[i][key] == value) {
            this.splice(i, 1);
        }
    }
};
function Maui() {

    var mowee = this;

    this.gmap = null;
    this.bus_stops = [];
    this.way_points = [];
    this.map_name = '';
    this.centering = false;

    // creates and assigns attributes for this
    this.loadBusStops = function (buses) {
        if (!this.gmap) this.gmap = new BaseMap();
        this.bus_stops = buses;
        for (var i = 0; i < buses.length; i++) this[buses[i]['location']] = buses[i]['name'];
    };

    /**
     *
     * @param origin (google.maps.LatLng)
     * @param destination (google.maps.LatLng)
     * @param waypoints (Array)
     */
    this.drawRoute = function (origin, destination, waypoints) {
        if (typeof Center !== 'undefined') {
            this.centering = true;
            this.centerMap();
        } else {
            this.setWayPoints(waypoints);

            var request = {
                origin: origin,
                destination: destination,
                travelMode: google.maps.TravelMode.DRIVING,
                waypoints: this.way_points
            };

            this.gmap.directionsService.route(request, function (result, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    mowee.gmap.directionsDisplay.setDirections(result);
                }
            });
            this.gmap.addMarkers(this.bus_stops, this.map_name);
        }
    };

    this.setWayPoints = function (waypoints) {
        for (var i = 0; i < waypoints.length; i++) {

            var my_stop = null
                , way_opts = {};

            if (waypoints[i] && /:stopover/.test(waypoints[i])) {
                my_stop = this.bus_stops.findObject(waypoints[i].split(':')[0], 'location');
                way_opts.stopover = false;
            } else {
                my_stop = this.bus_stops.findObject(waypoints[i], 'location')
            }
            way_opts.location = new google.maps.LatLng(my_stop.lat, my_stop.long);
            this.way_points[i] = way_opts;
        }
    };

    this.setMapName = function (name) {
        this.map_name = name;
    };

    this.centerMap = function (the_center) {
        var my_center = the_center || this.bus_stops.findObject(this[Center], 'name')
            , coords = new google.maps.LatLng(my_center.lat, my_center.long)
            , base = this.gmap.addMarkers([my_center], this.map_name)[0];

        this.gmap.map.setCenter(coords);
        this.gmap.map.setZoom(this.gmap.map.getZoom() + 11);
        google.maps.event.trigger(base.marker, 'click');
    };

    this.addQueenKaahumanuBack = function () {
        this.bus_stops.push({
            hidden: true,
            lat: 20.884325,
            long: -156.476362,
            location: "queen_kaahumanu_back",
            name: "Back of Queen Kaahumanu"
        });
    };
}
;
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

    this.addRoute = function (route_obj) {
        var direct_service = new google.maps.DirectionsService(),
            direct_display = new google.maps.DirectionsRenderer({suppressMarkers: true});

        direct_display.setMap(this.map);
        direct_service.route(route_obj, function (result, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                direct_display.setDirections(result);
            }
        });
    }
}
;
var info_window = null,
    last_stop = '';
function BaseMarker(gmap, gmap_options, marker_content) {
    var me = this;
    this.marker = new google.maps.Marker(gmap_options);

    google.maps.event.addListener(this.marker, 'click', function () {
        var bus_stop_name = this.title.replace(/.+\n/, '');
        if (info_window) {
            info_window.close();
        }
        if (last_stop !== bus_stop_name) {
            last_stop = this.title.replace(/.+\n/, '');
            info_window = new google.maps.InfoWindow(
                {
                    size: new google.maps.Size(150, 50)
                });

            info_window.setContent(marker_content);
            info_window.open(gmap, me.marker);
        } else {
            last_stop = '';
        }
    });
}
;
// ...




;
