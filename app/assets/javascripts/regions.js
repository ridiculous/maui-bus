var Schedules = {}, Toga = new Toggler();

jUtils.addEvent(window, 'load', function () {

    var show_times = jUtils.findByClass('time-list')
        , loadBusSchedule = function () {
            // if the container is present, great we're good to go, else load the table for this bus
            if (document.getElementById(this.rel + '_container')) {
                Toga.tableToggle.call(this);
            } else {
                var link = this
                    , region_route = this.rel.split('_')
                    , region = region_route[0]
                    , route = region_route[1]
                    , container = document.createElement('div')
                    , agile = new AjaxService('/regions/' + region + '/routes/' + route + '/schedule', 'GET');

                container.innerHTML = '<h5 class="loader">Loading ... </h5>';
                document.getElementById(this.rel).parentNode.appendChild(container);
                agile.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
                agile.on('success', function (data) {
                    container.innerHTML = data.responseText;
                    Toga.tableToggle.call(link);
                    container = document.getElementById(link.rel + '_container');

                    // loop through all the <li> nav pills (morning, evening, all)
                    for (var a = 0, pills = container.childNodes[1].childNodes; a < pills.length; a++) {
                        var time_frame_link = pills[a].childNodes[0];
                        if (pills[a].className == 'active') {
                            changeTimeFrame.call(time_frame_link);
                        }
                        jUtils.addEvent(time_frame_link, 'click', changeTimeFrame);
                    }
                });
                agile.send();
            }
        };

    jUtils.addEvent(show_times, 'click', loadBusSchedule);
    jUtils.addEvent(jUtils.findByClass('next-stop-list'), 'click', Toga.nextStopsToggle);

    if (!document.getElementById('delay')) {
        jUtils.addEvent(jUtils.findByClass('time-frame'), 'click', changeTimeFrame);

        // trigger time frames with morning/afternoon nav pill
        for (var a = 0, pills = jUtils.findByClass('active'); a < pills.length; a++) {
            changeTimeFrame.call(pills[a].childNodes[0]);
        }
    }

    // the glyphicons are the largest asset loaded so lets load it afterward as not to delay DOM +ready+
    for (var i = 0, icons = jUtils.findByClass('icon'); i < icons.length; i++) {
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

    if (jUtils.hasClass(this, 'morning')) {
        bus.toggleAM('table-cell').togglePM('none');
    } else if (jUtils.hasClass(this, 'afternoon')) {
        bus.toggleAM('none').togglePM('table-cell');
    } else {
        bus.toggleAM('table-cell').togglePM('table-cell');
    }
}