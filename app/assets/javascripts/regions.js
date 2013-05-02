var jUtils = {
    addEvent: function (el, event_name, callback) {
        if (el.addEventListener) {
            el.addEventListener(event_name, callback);
        } else if (el.attachEvent) {
            el.attachEvent('on' + event_name, callback);
        } else {
            el[event_name] = callback;
        }
    },
    findByClass: function (class_name) {
        if (document.getElementsByClassName) {
            return document.getElementsByClassName(class_name);
        }
        else {
            return document.querySelectorAll('.' + class_name);
        }
    }
};

jUtils.addEvent(window, 'load', function () {
//    for (var t = 0, times = jUtils.findByClass('time-list'); t < times.length; t++) {
//        jUtils.addEvent(times[t], 'click', showBusStops)
//    }
    jUtils.addEvent(document.getElementById('close_modal'), 'click', function () {
        var modal = document.getElementById('mba_modal');
        modal.className += ' fade';
        setTimeout(function () {
            modal.className += ' hide';
        }, 500);
    });
    for (var vs = 0, locations = jUtils.findByClass('show-static-map'); vs < locations.length; vs++) {
        jUtils.addEvent(locations[vs], 'click', showStaticMap);
    }
});

function showBusStops() {
    var class_names = this.className.split(/\s+/)
        , active_class = class_names.find('active')
        , route_name = this.rel
        , times_table = document.getElementById(route_name + '_table')
        , badge_wrap = document.getElementById(route_name);

    if (active_class === -1) {
        this.className += ' active';
        badge_wrap.style.display = 'none';
        times_table.style.display = 'table';
    } else {
        class_names.splice(active_class, 1);
        this.className = class_names.join(' ');
        badge_wrap.style.display = 'block';
        times_table.style.display = 'none';
    }

    return false;
}
function showStaticMap() {
    var map_url = 'http://maps.googleapis.com/maps/api/staticmap?zoom=16&size=530x400&maptype=roadmap&sensor=false&markers=color:green%7C'
        , modal = document.getElementById('mba_modal')
        , modal_body = document.getElementById('modal_body')
        , coords = this.rel;

    map_url += coords;
    map_url += '&center=' + coords;  // center=20.886320,-156.475224
    modal_body.innerHTML = '<img src="' + map_url + '" width="530" height="400" />';
    modal.className = 'modal';
}