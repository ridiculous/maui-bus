function Islander(a){maui.setMapName("Kaanapali Islander #25"),maui.loadBusStops(a||Locations);var n=maui.bus_stops.findObject(maui.wharf_cinema,"name"),e=new google.maps.LatLng(n.lat,n.long);maui.drawRoute(e,e,["wharf_cinema","papalaua_st","lahaina_cannery_mall","whalers_village"])}!function(){new Islander}();