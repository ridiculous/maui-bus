function Villager(e){maui.setMapName("Lahaina Villager #23"),maui.loadBusStops(e||Locations);var t=maui.bus_stops.findObject(maui.wharf_cinema,"name"),n=maui.bus_stops.findObject(maui.lahaina_civic_center,"name"),r=maui.bus_stops.findObject(maui.lahaina_cannery_mall,"name"),i=maui.bus_stops.findObject(maui.papalaua_st,"name"),s=new google.maps.LatLng(t.lat,t.long),o=new google.maps.LatLng(n.lat,n.long),u=new google.maps.LatLng(20.889207,-156.684823),a=new google.maps.LatLng(20.880907,-156.684308);maui.drawRoute(s,o,["front_street_505","na_halee","liloa_hokeo","kalena_pikanele_lahaina","hale_mahaolu_eono","lahaina_gateway","ainakea_malolo_lahaina","leialii_parkway_lahaina"]),maui.centering||maui.gmap.addRoute({origin:o,destination:s,travelMode:google.maps.TravelMode.DRIVING,avoidHighways:!0,waypoints:[{location:u},{location:new google.maps.LatLng(r.lat,r.long)},{location:a},{location:new google.maps.LatLng(i.lat,i.long)}]})}(function(){new Villager})();