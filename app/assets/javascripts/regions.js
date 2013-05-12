var Schedules = {}, Toga = new Toggler();

jUtils.addEvent(window, 'load', function () {

    jUtils.addEvent(jUtils.findByClass('time-list'), 'click', Toga.tableToggle);
    jUtils.addEvent(jUtils.findByClass('next-stop-list'), 'click', Toga.nextStopsToggle);
    jUtils.addEvent(jUtils.findByClass('time-frame'), 'click', changeTimeFrame);

    // trigger time frames with morning/afternoon nav pill
    for (var a = 0, pills = jUtils.findByClass('active'); a < pills.length; a++) {
        changeTimeFrame.call(pills[a].childNodes[0]);
    }

    // the glyphicons are the largest asset loaded so lets load it afterward as not to delay DOM +ready+
    for (var i = 0, icons = jUtils.findByClass('icon'); i < icons.length; i++) {
        icons[i].className += ' icon-white';
    }
});

function changeTimeFrame() {
    var route_name = this.rel
        , parent = this.parentElement
        , prev = parent
        , nxt = parent
        , bus = Schedules[route_name];

    if (!route_name) {
        return;
    }

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