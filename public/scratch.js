(new google.maps.DirectionsService()).route({
    origin: new google.maps.LatLng(20.886570, -156.475375),
    destination: new google.maps.LatLng(20.8943, -156.4377),
    waypoints: [
        {
            location: new google.maps.LatLng(20.883693, -156.471705)
        },
        {
            location: new google.maps.LatLng(20.88789, -156.4676064)
        }
    ],
    travelMode: 'DRIVING'
}, function (result, status) {
    var x = google.maps.geometry.encoding.encodePath(result.routes[0].overview_path);
    console.log(x)
});
// get current users location
var t = navigator.geolocation.getCurrentPosition(function(a) { alert(a) });
t.coords.latitude + ','+ t.coords.longitude
/*
 URL for a static map fof upcountry islander
 http://maps.googleapis.com/maps/api/staticmap
 ?zoom=14
 &size=600x600
 &sensor=false
 &maptype=roadmap
 &path=weight:3|enc:_in~Bzy`z\dAUt@Ml@EtAIb@Df@RHKJ_@d@mBPmANcBNgCP{CNmIBs@{@]sBq@uA[eEe@cAMoAe@q@a@c@c@i@{@e@mASu@qA_Gj@Qk@PqA{FuA}FcA_EcBsHOc@Ua@}@_AqA}@_BaAxAaCfFkIlAoBzD}G`C{DlDoG~AcDnCmF[KoE}AiE_Bc@_@g@q@]u@yBuFgEyK{GePaBiEeAuByAkDk@aBw@eBAW?o@Da@tC}EN_@F]Ag@Ci@MYeJgGw@m@
 */

var directionDisplay;
var directionsService = new google.maps.DirectionsService();
var gmarkers = [];
var map = null;
var startLocation = null;
var endLocation = null;
var directionsService = null;
var waypts = null;
var polyline = new google.maps.Polyline({
    path: [],
    strokeColor: '#FF0000',
    strokeWeight: 3
});

function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var chicago = new google.maps.LatLng(41.850033, -87.6500523);
    var myOptions = {
        zoom: 6,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: chicago
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    google.maps.event.addListener(map, 'click', function() {
        infowindow.close();
    });
    directionsDisplay.setMap(map);
    calcRoute();
}

function calcRoute() {
    directionsService = new google.maps.DirectionsService();

    var request = {
        origin: "1521 NW 54th St, Seattle, WA 98107 ",
        destination: "San Diego, CA",
        waypoints: [{
            location:new google.maps.LatLng(42.496403,-124.413128),
            stopover:true}],
        optimizeWaypoints: true,
        travelMode: google.maps.DirectionsTravelMode.WALKING
    };
    directionsService.route(request, RenderCustomDirections);
}
function RenderCustomDirections(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
        waypts = [];
        var bounds = new google.maps.LatLngBounds();
        var route = response.routes[0];
        var summaryPanel = document.getElementById("directions_panel");
        var detailsPanel = document.getElementById("direction_details");
        startLocation = new Object();
        endLocation = new Object();

        summaryPanel.innerHTML = "";
        detailsPanel.innerHTML = '<ul>';

        // For each route, display summary information.
        for (var i = 0; i < route.legs.length; i++) {
            var routeSegment = i + 1;
            summaryPanel.innerHTML += "<b>Route Segment: " + routeSegment + "</b><br />";
            summaryPanel.innerHTML += route.legs[i].start_address + " to ";
            summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
            summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />";
        }
        var path = response.routes[0].overview_path;
        var legs = response.routes[0].legs;
// alert("processing "+legs.length+" legs");
        for (i=0;i<legs.length;i++) {
            if (i == 0) {
                startLocation.latlng = legs[i].start_location;
                startLocation.address = legs[i].start_address;
                startLocation.marker = createMarker(legs[i].start_location,"start",legs[i].start_address,"green");
            } else {
                waypts[i] = new Object();
                waypts[i].latlng = legs[i].start_location;
                waypts[i].address = legs[i].start_address;
                waypts[i].marker = createMarker(legs[i].start_location,"waypoint"+i,legs[i].start_address,"yellow");
            }
            endLocation.latlng = legs[i].end_location;
            endLocation.address = legs[i].end_address;
            var steps = legs[i].steps;
// alert("processing "+steps.length+" steps");
            for (j=0;j<steps.length;j++) {
                var nextSegment = steps[j].path;
                /*
                 detailsPanel.innerHTML += "<li>"+steps[j].instructions;
                 var dist_dur = "";
                 if (steps[j].distance && steps[j].distance.text) dist_dur += "&nbsp;"+steps[j].distance.text;
                 if (steps[j].duration && steps[j].duration.text) dist_dur += "&nbsp;"+steps[j].duration.text;
                 if (dist_dur != "") {
                 detailsPanel.innerHTML += "("+dist_dur+")<br /></li>";
                 } else {
                 detailsPanel.innerHTML += "</li>";

                 }
                 */
                for (k=0;k<nextSegment.length;k++) {
                    polyline.getPath().push(nextSegment[k]);
                    bounds.extend(nextSegment[k]);



                }
            }
        }

        detailsPanel.innerHTML += "</ul>"
        polyline.setMap(map);
        map.fitBounds(bounds);
        endLocation.marker = createMarker(endLocation.latlng,"end",endLocation.address,"red");
        // == create the initial sidebar ==
        makeSidebar();

    }
    else alert(status);
}

var icons = new Array();
icons["red"] = new google.maps.MarkerImage("mapIcons/marker_red.png",
    // This marker is 20 pixels wide by 34 pixels tall.
    new google.maps.Size(20, 34),
    // The origin for this image is 0,0.
    new google.maps.Point(0,0),
    // The anchor for this image is at 9,34.
    new google.maps.Point(9, 34));
function getMarkerImage(iconColor) {
    if ((typeof(iconColor)=="undefined") || (iconColor==null)) {
        iconColor = "red";
    }
    if (!icons[iconColor]) {
        icons[iconColor] = new google.maps.MarkerImage("mapIcons/marker_"+ iconColor +".png",
            // This marker is 20 pixels wide by 34 pixels tall.
            new google.maps.Size(20, 34),
            // The origin for this image is 0,0.
            new google.maps.Point(0,0),
            // The anchor for this image is at 6,20.
            new google.maps.Point(9, 34));
    }
    return icons[iconColor];

}
// Marker sizes are expressed as a Size of X,Y
// where the origin of the image (0,0) is located
// in the top left of the image.

// Origins, anchor positions and coordinates of the marker
// increase in the X direction to the right and in
// the Y direction down.

var iconImage = new google.maps.MarkerImage('mapIcons/marker_red.png',
    // This marker is 20 pixels wide by 34 pixels tall.
    new google.maps.Size(20, 34),
    // The origin for this image is 0,0.
    new google.maps.Point(0,0),
    // The anchor for this image is at 9,34.
    new google.maps.Point(9, 34));
var iconShadow = new google.maps.MarkerImage('http://www.google.com/mapfiles/shadow50.png',
    // The shadow image is larger in the horizontal dimension
    // while the position and offset are the same as for the main image.
    new google.maps.Size(37, 34),
    new google.maps.Point(0,0),
    new google.maps.Point(9, 34));
// Shapes define the clickable region of the icon.
// The type defines an HTML &lt;area&gt; element 'poly' which
// traces out a polygon as a series of X,Y points. The final
// coordinate closes the poly by connecting to the first
// coordinate.
var iconShape = {
    coord: [9,0,6,1,4,2,2,4,0,8,0,12,1,14,2,16,5,19,7,23,8,26,9,30,9,34,11,34,11,30,12,26,13,24,14,21,16,18,18,16,20,12,20,8,18,4,16,2,15,1,13,0],
    type: 'poly'
};
var infowindow = new google.maps.InfoWindow(
    {
        size: new google.maps.Size(150,50)
    });

function createMarker(latlng, label, html, color) {
// alert("createMarker("+latlng+","+label+","+html+","+color+")");
    var contentString = '<b>'+label+'</b><br>'+html;
    var marker = new google.maps.Marker({
        position: latlng,
        draggable: true,
        map: map,
        shadow: iconShadow,
        icon: getMarkerImage(color),
        shape: iconShape,
        title: label,
        zIndex: Math.round(latlng.lat()*-100000)<<5
    });
    marker.myname = label;
    gmarkers.push(marker);

    google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(contentString);
        infowindow.open(map,marker);
    });
    google.maps.event.addListener(marker, 'dragend', function() {
// alert("drag ended! start:"+startLocation.marker.getPosition()+" end:"+endLocation.marker.getPosition());
        var request = {
            origin: startLocation.marker.getPosition(),
            destination: endLocation.marker.getPosition(),
            travelMode: google.maps.DirectionsTravelMode.WALKING
        };
        startLocation.marker.setMap(null);
        endLocation.marker.setMap(null);

        gmarkers = [];
        polyline.setMap(null);
        polyline = new google.maps.Polyline({
            path: [],
            strokeColor: '#FF0000',
            strokeWeight: 3
        });
        directionsService.route(request, RenderCustomDirections);

    });

    return marker;
}
function myclick(i) {
    google.maps.event.trigger(gmarkers[i],"click");
}
// == rebuilds the sidebar to match the markers currently displayed ==
function makeSidebar() {
    var html = "";
    for (var i=0; i<gmarkers.length; i++) {
        html += '<a href="javascript:myclick(' + i + ')">' + gmarkers[i].myname + '<\/a><br>';
    }
    document.getElementById("side_bar").innerHTML = html;
}
//]]>