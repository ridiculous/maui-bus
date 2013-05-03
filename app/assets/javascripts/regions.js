jUtils.addEvent(window, 'load', function () {
    for (var t = 0, times = jUtils.findByClass('time-list'); t < times.length; t++) {
        jUtils.addEvent(times[t], 'click', showBusStops)
    }

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

    for (var i = 0, options = jUtils.findByClass('time-frame'); i < options.length; i++) {
        jUtils.addEvent(options[i], 'click', changeTimeFrame);
    }

    for (var a = 0, pills = jUtils.findByClass('active'); a < pills.length; a++) {
        changeTimeFrame.call(pills[a].childNodes[0]);
    }
});

// ensure badges are visible by default ... hidden on my phone :/
jUtils.addEvent(window, 'pageshow', function () {
    for (var i = 0, wraps = jUtils.findByClass('badge-wrap'); i < wraps.length; i++) {
        wraps[i].style.display = 'block';
    }
});

function showBusStops() {
    var class_names = this.className.split(/\s+/)
        , active_class = class_names.find('active')
        , route_name = this.rel
        , times_table = document.getElementById(route_name + '_container')
        , badge_wrap = document.getElementById(route_name);

    if (active_class === -1) {
        this.className += ' active';
        badge_wrap.style.display = 'none';
        times_table.style.display = 'block';
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
var Schedules = {};

function changeTimeFrame() {
    var route_name = this.rel
        , parent = this.parentElement
        , prev = parent
        , nxt = parent
        , bus = Schedules[route_name];

    if (!route_name) return;
    if (!bus) {
        bus = new BusSchedule();
        bus.init(route_name);
        Schedules[route_name] = bus;
    }
    parent.className = 'active';

    while (nxt = nxt.nextSibling) {
        nxt.className = '';
    }

    while (prev = prev.previousSibling) {
        prev.className = '';
    }

    if (jUtils.hasClass(this, 'morning')) {
        bus.toggleAM('table-cell').togglePM('none');
    } else if (jUtils.hasClass(this, 'afternoon')) {
        bus.toggleAM('none').togglePM('table-cell');
    } else {
        bus.toggleAM('table-cell').togglePM('table-cell');
    }
}