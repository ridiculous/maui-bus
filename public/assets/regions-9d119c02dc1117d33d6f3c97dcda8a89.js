var Schedules = {}, Toga = new Toggler(); //, SM = new StaticMap()

$.addEvent(window, 'load', function () {

    var show_times = $.findByClass('time-list');

//    $.addEvent($.findByClass('show-static-map'), 'click', SM.init);
//    $.addEvent(document.getElementById('close_modal'), 'click', SM.hideModal);
    $.addEvent(show_times, 'click', Toga.tableToggle);
    $.addEvent($.findByClass('next-stop-list'), 'click', Toga.nextStopsToggle);
    $.addEvent($.findByClass('time-frame'), 'click', changeTimeFrame);

    // trigger time frames with morning/afternoon nav pill
    for (var a = 0, pills = $.findByClass('active'); a < pills.length; a++) {
        changeTimeFrame.call(pills[a].childNodes[0]);
    }

    // the glyphicons are the largest asset loaded so lets load it afterward as not to delay DOM +ready+
    for (var i = 0, icons = $.findByClass('icon'); i < icons.length; i++) {
        icons[i].className += ' icon-white';
    }

    if (window.location.hash) {
        for (var b = 0; b < show_times.length; b++) {
            if ('#' + show_times[b].rel == window.location.hash) {
                Toga.tableToggle.call(show_times[b]);
            }
        }
    } else {
        if (show_times.length === 1) {
            Toga.tableToggle.call(show_times[0]);
        }
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

    if ($.hasClass(this, 'morning')) {
        bus.toggleAM('table-cell').togglePM('none');
    } else if ($.hasClass(this, 'afternoon')) {
        bus.toggleAM('none').togglePM('table-cell');
    } else {
        bus.toggleAM('table-cell').togglePM('table-cell');
    }
}
;
