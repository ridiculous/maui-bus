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
        }
        , destination = document.getElementById('destination')
        , origin = document.getElementById('origin')
        , submit_search = document.getElementById('submit_search')
        , agile = new AjaxService('/search', 'GET')
        , tryResizeSearchBox = function () {
            try {
                var search_box = document.getElementById('search_box')
                    , map_canvas = document.getElementById('map_canvas')
                    , conservative_height = map_canvas.offsetHeight - 75;
                if (search_box.offsetHeight > conservative_height + 25) {
                    search_box.style.maxHeight = conservative_height + 'px';
                    search_box.style.overflowY = 'scroll';
                } else{
                    search_box.style.maxHeight = '';
                    search_box.style.overflowY = '';
                }
            } catch (e) {
                if (window.console) console.log('Error setting height of search box! ' + e);
            }
        };

    addMarkers();
    my_map.setCenter(maui.gmap.Mall);
    my_map.setZoom(my_map.getZoom() + 4);

    agile.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    agile.on('success', function (data) {
        document.getElementById('direct_routes').innerHTML = data.responseText;
        submit_search.disabled = false;
        submit_search.value = 'Search';
        tryResizeSearchBox();
    });
    agile.on('error', function () {
        document.getElementById('direct_routes').innerHTML = '<h3 class="error-text">Oops, an error has occured!</h3>';
        submit_search.disabled = false;
        submit_search.value = 'Search';
    });

    jUtils.addEvent(submit_search, 'click', function (e) {
        var evt = jUtils.getEvent(e);
        this.value = 'Searching';
        this.disabled = true;
        agile.send({async: '1', origin: origin.value, destination: destination.value});
        window.location.hash = origin.value + '-' + destination.value;
        if (typeof evt.preventDefault === 'function') {
            evt.preventDefault();
        }
        return false;
    });

    var points = window.location.hash.split('-');

    if (points.length === 2) {
        origin.value = points[0].replace('#', '');
        destination.value = points[1];
        agile.send({async: '1', origin: origin.value, destination: destination.value});
    }

    if (document.getElementById('is_desktop')) {
        tryResizeSearchBox()
    }

})();

