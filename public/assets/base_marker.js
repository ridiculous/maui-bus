function BaseMarker(e,t,n){var r=this;this.marker=new google.maps.Marker(t),google.maps.event.addListener(this.marker,"click",function(){var t=new google.maps.InfoWindow({size:new google.maps.Size(150,50)});t.setContent(n),t.open(e,r.marker)})};