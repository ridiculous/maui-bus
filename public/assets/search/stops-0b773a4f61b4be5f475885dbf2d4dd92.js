(function () {
    maui.loadBusStops(Locations); // map location to name

    var my_center = maui.bus_stops.findObject('Waikapu', 'name')
        , coords = new google.maps.LatLng(my_center.lat, my_center.long);

    maui.gmap.addMarkers(maui.bus_stops);
    maui.gmap.map.setCenter(coords);
    maui.gmap.map.setZoom(maui.gmap.map.getZoom() + 4);
})();
