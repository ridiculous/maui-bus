function BaseMarker(gmap, gmap_options, marker_content) {
    var me = this;
    this.marker = new google.maps.Marker(gmap_options);

    google.maps.event.addListener(this.marker, 'click', function () {

        var info_window = new google.maps.InfoWindow(
            {
                size: new google.maps.Size(150, 50)
            });
        info_window.setContent(marker_content);
        info_window.open(gmap, me.marker);
    });
}