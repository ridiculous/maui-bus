function BaseMap(){this.Mall=new google.maps.LatLng(20.88657,-156.475375),this.directionsDisplay=null,this.directionsService=new google.maps.DirectionsService,this.directionsDisplay=new google.maps.DirectionsRenderer({suppressMarkers:!0}),this.mapOptions={zoom:7,mapTypeId:google.maps.MapTypeId.ROADMAP,center:this.Mall},this.map=new google.maps.Map(document.getElementById("map_canvas"),this.mapOptions),this.directionsDisplay.setMap(this.map),this.addMarkers=function(e,t){for(var n=0;n<e.length;n++)if(!e[n].hidden){var r={position:new google.maps.LatLng(e[n].lat,e[n].long),map:this.map,title:t+"\n"+e[n].name};new BaseMarker(this.map,r,r.title.replace(/\n/,"<br />")+"<br />"+e[n].times)}},this.addRoute=function(e){var t=new google.maps.DirectionsService,n=new google.maps.DirectionsRenderer({suppressMarkers:!0});n.setMap(this.map),t.route(e,function(e,t){t==google.maps.DirectionsStatus.OK&&n.setDirections(e)})}};