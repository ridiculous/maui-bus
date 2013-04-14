function BaseMarker(gmap, marker_options) {
    var me = this;
    this.marker = new google.maps.Marker(marker_options);

    google.maps.event.addListener(this.marker, 'click', function () {

        var info_window = new google.maps.InfoWindow(
            {
                size: new google.maps.Size(150, 50)
            });
        info_window.setContent(me.marker.title.replace(/\n/g, '<br />'));
        info_window.open(gmap, me.marker);
    });
}