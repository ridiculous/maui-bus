function BaseMap(e){this.Mall=new google.maps.LatLng(20.88657,-156.475375),this.mapOptions=e||{zoom:7,mapTypeId:google.maps.MapTypeId.ROADMAP,center:this.Mall},this.map=new google.maps.Map(document.getElementById("map_canvas"),this.mapOptions),this.directionsService=new google.maps.DirectionsService,this.directionsDisplay=new google.maps.DirectionsRenderer({suppressMarkers:!0}),this.directionsDisplay.setMap(this.map),this.addMarkers=function(e,t){var n=[];for(var r=0;r<e.length;r++)if(!e[r].hidden){var i={position:new google.maps.LatLng(e[r].lat,e[r].long),map:this.map,title:t+"\n"+e[r].name};n.push(new BaseMarker(this.map,i,i.title.replace(/\n/,"<br />")+"<br />"+e[r].times))}return n},this.addRoute=function(e){var t=new google.maps.DirectionsService,n=new google.maps.DirectionsRenderer({suppressMarkers:!0});n.setMap(this.map),t.route(e,function(e,t){t==google.maps.DirectionsStatus.OK&&n.setDirections(e)})}};