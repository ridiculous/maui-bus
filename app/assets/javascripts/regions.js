var Schedules = {};

jUtils.addEvent(window, 'load', function () {
    jUtils.addEvent(jUtils.findByClass('time-list'), 'click', showBusStops);
    jUtils.addEvent(jUtils.findByClass('show-static-map'), 'click', showStaticMap);
    jUtils.addEvent(jUtils.findByClass('next-stop-list'), 'click', ShowNextStops);
    jUtils.addEvent(jUtils.findByClass('time-frame'), 'click', changeTimeFrame);

    for (var a = 0, pills = jUtils.findByClass('active'); a < pills.length; a++) {
        changeTimeFrame.call(pills[a].childNodes[0]);
    }

    jUtils.addEvent(document.getElementById('close_modal'), 'click', function () {
        var modal = document.getElementById('mba_modal');
        modal.className += ' fade';
        setTimeout(function () {
            modal.className += ' hide';
        }, 500);
    });
});

function showBusStops() {
    var class_names = this.className.split(/\s+/)
        , active_class = class_names.find('active')
        , route_name = this.rel
        , times_table = document.getElementById(route_name + '_container');

    if (active_class === -1) {
        this.className += ' active';
        times_table.style.display = 'block';
    } else {
        class_names.splice(active_class, 1);
        this.className = class_names.join(' ');
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

function ShowNextStops() {
    var me = document.getElementById(this.rel);

    if (jUtils.hasClass(me, 'hidden-phone')) {
        me.className = '';
    } else {
        me.className = 'hidden-phone hidden-tablet';
    }
}

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