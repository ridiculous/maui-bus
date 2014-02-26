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
                    markers.push(new SearchMarker(my_stop.location, gmap_options, gmap_options.title + bubble_html));
                }
            }
        }
        , destination = document.getElementById('destination')
        , origin = document.getElementById('origin')
        , search_time = document.getElementById('search_time')
        , submit_search = document.getElementById('submit_search')
        , agile = new AjaxService('/search', 'GET')
        , renderers = [maui.gmap.directionsDisplay]
        , tryResizeSearchBox = function () {
            try {
                var search_box = document.getElementById('search_box')
                    , map_canvas = document.getElementById('map_canvas')
                    , map_canvas_height = map_canvas.offsetHeight;

                if (search_box.offsetHeight > map_canvas_height - (search_box.style.overflowY == 'scroll' ? 54 : 40)) {
                    search_box.style.maxHeight = (map_canvas_height - 75) + 'px';
                    search_box.style.overflowY = 'scroll';
                } else {
                    search_box.style.maxHeight = '';
                    search_box.style.overflowY = '';
                }
            } catch (e) {
                if (window.console) console.log('Error setting height of search box! ' + e);
            }
        }, requestSearchResults = function () {
            submit_search.value = 'Searching';
            submit_search.disabled = true;
            agile.send({origin: origin.value, destination: destination.value, search_time: search_time.value});
            window.location.hash = origin.value + '-' + destination.value + '-' + search_time.value.replace(/\s/g, '_');
        }, plotRoute = function (points) {
            try {
                for (var r = 0; r < renderers.length; r++) {
                    if (renderers[r]) {
                        renderers[r].setMap(null);
                    }
                }
                for (var i = 0; i < points.length; i++) {
                    if (points[i].length) {
                        renderers.push(maui.gmap.connectPoints(points[i][0], points[i][1]));
                    }
                }
            } catch (e) {
                if (console) console.log('error in drawing route: ' + e);
            }
        };

    addMarkers();
    my_map.setCenter(maui.gmap.Mall);
    my_map.setZoom(my_map.getZoom() + 4);

    agile.setRequestHeader('X-Requested-With', 'XMLHttpRequest'); // to play nice with rails (allows request.xhr?)
    agile.on('success', function (data) {
        var response = JSON.parse(data.responseText);
        document.getElementById('direct_routes').innerHTML = response.html;
        submit_search.disabled = false;
        submit_search.value = 'Search';
        plotRoute(response.points);
        tryResizeSearchBox();
    });
    agile.on('failure', function (response) {
        var dr = document.getElementById('direct_routes'), msg = '';
        if (!response.status) {
            msg = "Server can't be reached! Please check your connection."
        } else {
            msg = "Oops, something went wrong ..."
        }
        dr.innerHTML = '<div class="error-text mini well mt10">' + msg + '</div>';
        submit_search.disabled = false;
        submit_search.value = 'Search';
    });

    jUtils.addEvent(submit_search, 'click', function (e) {
        var evt = jUtils.getEvent(e);
        requestSearchResults();
        if (typeof evt.preventDefault === 'function') {
            evt.preventDefault();
        }
        return false;
    });

    var points = window.location.hash.split('-');

    if (points.length === 3) {
        origin.value = points[0].replace('#', '');
        destination.value = points[1];
        search_time.value = points[2].replace(/_/g, ' ');
        requestSearchResults();
    }

    if (document.getElementById('is_desktop')) {
        tryResizeSearchBox()
    }

    jUtils.addEvent([search_time], 'change', function () {
        requestSearchResults();
    });

})();

