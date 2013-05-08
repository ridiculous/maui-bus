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