function Maui(){var t=this;this.gmap=null,this.bus_stops=[],this.way_points=[],this.map_name="",this.centering=!1,this.loadBusStops=function(t){this.gmap||(this.gmap=new BaseMap),this.bus_stops=t;for(var e=0;e<t.length;e++)this[t[e].location]=t[e].name},this.drawRoute=function(e,n,i){if("undefined"!=typeof Center)this.centering=!0,this.centerMap();else{this.setWayPoints(i);var s={origin:e,destination:n,travelMode:google.maps.TravelMode.DRIVING,waypoints:this.way_points};this.gmap.directionsService.route(s,function(e,n){n==google.maps.DirectionsStatus.OK&&t.gmap.directionsDisplay.setDirections(e)}),this.gmap.addMarkers(this.bus_stops,this.map_name)}},this.setWayPoints=function(t){for(var e=0;e<t.length;e++){var n=null,i={};t[e]&&/:stopover/.test(t[e])?(n=this.bus_stops.findObject(t[e].split(":")[0],"location"),i.stopover=!1):n=this.bus_stops.findObject(t[e],"location"),i.location=new google.maps.LatLng(n.lat,n.long),this.way_points[e]=i}},this.setMapName=function(t){this.map_name=t},this.centerMap=function(t){var e=t||this.bus_stops.findObject(this[Center],"name"),n=new google.maps.LatLng(e.lat,e.long),i=this.gmap.addMarkers([e],this.map_name)[0];this.gmap.map.setCenter(n),this.gmap.map.setZoom(this.gmap.map.getZoom()+11),google.maps.event.trigger(i.marker,"click")},this.addQueenKaahumanuBack=function(){this.bus_stops.push({hidden:!0,lat:20.884325,"long":-156.476362,location:"queen_kaahumanu_back",name:"Back of Queen Kaahumanu"})}}function BaseMap(t){this.Mall=new google.maps.LatLng(20.88657,-156.475375),this.mapOptions=t||{zoom:7,mapTypeId:google.maps.MapTypeId.ROADMAP,center:this.Mall},this.map=new google.maps.Map(document.getElementById("map_canvas"),this.mapOptions),this.directionsService=new google.maps.DirectionsService,this.directionsDisplay=new google.maps.DirectionsRenderer({suppressMarkers:!0}),this.directionsDisplay.setMap(this.map),this.addMarkers=function(t,e){for(var n=[],i=e?e+"\n":"",s=0;s<t.length;s++)if(!t[s].hidden){var o={position:new google.maps.LatLng(t[s].lat,t[s].long),map:this.map,title:i+t[s].name},a=o.title.replace(/\n/,"<br />");t[s].times&&(a+="<br />"+t[s].times),n.push(new BaseMarker(this.map,o,a))}return n},this.addRoute=function(t){var e=new google.maps.DirectionsService,n=new google.maps.DirectionsRenderer({suppressMarkers:!0});n.setMap(this.map),e.route(t,function(t,e){e==google.maps.DirectionsStatus.OK&&n.setDirections(t)})}}function SearchMarker(t,e,n){var i=maui.gmap.map,s=new google.maps.Marker(e);google.maps.event.addListener(s,"click",function(){return info_window&&info_window.close(),this.title===last_stop?(last_stop="",void 0):(last_stop=this.title,info_window=new google.maps.InfoWindow({size:new google.maps.Size(150,50)}),info_window.setContent(n),info_window.open(i,s),jUtils.addEvent(jUtils.findByClass("destination"),"click",function(e){document.getElementById("destination").value=t,info_window.close(),e.stopPropagation()}),jUtils.addEvent(jUtils.findByClass("origin"),"click",function(e){document.getElementById("origin").value=t,info_window.close(),e.stopPropagation()}),void 0)})}Number.prototype.timesDo=function(t){if(t)for(var e=0;this>e;e++)t.call()},String.prototype.squeeze=function(){return this.replace(/\s+/g,"")},String.prototype.pluralize=function(t){var e="s";return 1==t&&(e=""),this+e},Array.prototype.compacted=function(){for(var t=[],e=0;e<this.length;e++)void 0!==this[e]&&null!==this[e]&&this[e]!==!1&&t.push(this[e]);return t},Array.prototype.find=function(t){for(var e=-1,n=0;n<this.length;n++)this[n]==t&&(e=n);return e},Array.prototype.findObject=function(t,e){for(var n=null,i=0;i<this.length;i++)this[i][e]==t&&(n=this[i]);return n},Array.prototype.updateObject=function(t,e,n,i){for(var s=0;s<this.length;s++)if(this[s][e]==i)return this[s][n]=i},Array.prototype.findAndRemove=function(t){for(var e=0;e<this.length;e++)this[e]==t&&this.splice(e,1)},Array.prototype.findAndRemoveObject=function(t,e){for(var n=0;n<this.length;n++)this[n]&&this[n][e]==t&&this.splice(n,1)};var info_window=null,last_stop="",jUtils={addEvent:function(t,e,n){var i=function(t){t.addEventListener?t.addEventListener(e,n):t.attachEvent?t.attachEvent("on"+e,function(){n.call(this.target||this.event.srcElement)}):t[e]=n};if("undefined"!=typeof t[0])for(var s=0;s<t.length;s++)i(t[s]);else i(t)},removeEvent:function(t,e,n){t.removeEventListener?t.removeEventListener(e,n,!1):t.detachEvent?t.detachEvent("on"+e,n):t[e]=null},findByClass:function(t){return document.getElementsByClassName?document.getElementsByClassName(t):document.querySelectorAll("."+t)},hasClass:function(t,e){return t.classList?t.classList.contains(e):-1!==t.className.split(/\s+/).find(e)},getEvent:function(t){return t?t:window.event}};