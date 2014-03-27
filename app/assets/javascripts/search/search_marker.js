var info_window = null,
    last_stop = '';

function SearchMarker(location_key, gmap_options, marker_content) {
    var gmap = maui.gmap.map
        , marker = new google.maps.Marker(gmap_options);

    google.maps.event.addListener(marker, 'click', function () {
        if (info_window) {
            info_window.close();
        }
        // toggle
        if (this.title === last_stop) {
            last_stop = '';
            return;
        }
        last_stop = this.title;
        info_window = new google.maps.InfoWindow(
            {
                size: new google.maps.Size(150, 50)
            });

        info_window.setContent(marker_content);
        info_window.open(gmap, marker);

        var destination = document.getElementById('destination')
            , origin = document.getElementById('origin');

        jUtils.addEvent(jUtils.findByClass('destination'), 'click', function (e) {
            destination.value = location_key;
            info_window.close();
            e.stopPropagation();
        });
        jUtils.addEvent(jUtils.findByClass('origin'), 'click', function (e) {
            origin.value = location_key;
            info_window.close();
            e.stopPropagation();
        });
    });
}