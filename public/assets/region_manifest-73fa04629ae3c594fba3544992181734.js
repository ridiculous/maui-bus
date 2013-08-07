/**
 * Kind of like ruby's 3.times do .. end method
 * usage: (3).timesDo(function() {} );
 *
 * @param callback {function} to be called however many times
 */

Number.prototype.timesDo = function (callback) {
    if (callback) {
        for (var i = 0; i < this; i++) {
            callback.call();
        }
    }
};

String.prototype.squeeze = function () {
    return this.replace(/\s+/g, '');
};

String.prototype.pluralize = function (count) {
    var plural = 's';
    if (count == 1) plural = '';
    return this + plural;

};

//
// Array extensions
//
Array.prototype.compacted = function () {
    var tmp = [];
    for (var i = 0; i < this.length; i++) {
        if (this[i] !== undefined && this[i] !== null && this[i] !== false) {
            tmp.push(this[i]);
        }
    }
    return tmp;
};

Array.prototype.find = function (value) {
    var found = -1;
    for (var i = 0; i < this.length; i++) {
        if (this[i] == value) {
            found = i;
        }
    }
    return found;
};

Array.prototype.findObject = function (value, key) {
    var my_obj = null;
    for (var i = 0; i < this.length; i++) {
        if (this[i][key] == value) {
            my_obj = this[i];
        }
    }
    return my_obj;
};

Array.prototype.updateObject = function (id, key, value_key, value) {
    for (var i = 0; i < this.length; i++) {
        if (this[i][key] == value) {
            return this[i][value_key] = value;
        }
    }
};

Array.prototype.findAndRemove = function (value) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == value) {
            this.splice(i, 1);
        }
    }
};

Array.prototype.findAndRemoveObject = function (value, key) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] && this[i][key] == value) {
            this.splice(i, 1);
        }
    }
};
var $ = {
    addEvent: function (el, event_name, callback) {
        var addHandler = function (elem) {
            if (elem.addEventListener) {
                elem.addEventListener(event_name, callback);
            } else if (elem.attachEvent) {
                elem.attachEvent('on' + event_name, function () {
                    callback.call(this.target || this.event.srcElement);
                });
            } else {
                elem[event_name] = callback;
            }
        };

        if (typeof el[0] !== 'undefined') {
            for (var i = 0; i < el.length; i++) {
                addHandler(el[i])
            }
        } else {
            addHandler(el)
        }
    },
    removeEvent: function (elem, event_name, callback) {
        if (elem.removeEventListener) {
            elem.removeEventListener(event_name, callback, false);
        } else if (elem.detachEvent) {
            elem.detachEvent('on' + event_name, callback);
        } else {
            elem[event_name] = null;
        }
    },
    findByClass: function (class_name) {
        if (document.getElementsByClassName) {
            return document.getElementsByClassName(class_name);
        }
        else {
            return document.querySelectorAll('.' + class_name);
        }
    },
    hasClass: function (elem, class_name) {
        if (elem.classList) {
            return elem.classList.contains(class_name);
        } else {
            return elem.className.split(/\s+/).find(class_name) !== -1;
        }
    },
    getEvent: function(e) {
        return e ? e : window.event;
    }
};
/**
 * usage:
 *
 * var SM = new StaticMap();
 * $.addEvent($.findByClass('show-static-map'), 'click', SM.init);
 * $.addEvent(document.getElementById('close_modal'), 'click', SM.hideModal);
 * @constructor
 */

function StaticMap() {

    var sm = this;

    this.$modal = document.getElementById('mba_modal');
    this.$modal_body = document.getElementById('modal_body');
    this.map_url = 'http://maps.googleapis.com/maps/api/staticmap?' +
        'zoom=16&size=530x400&maptype=roadmap&sensor=false&markers=color:green%7C';

    this.init = function () {
        var coords = this.rel,
            this_map_url = sm.map_url;

        this_map_url += coords;
        this_map_url += '&center=' + coords;  // center=20.886320,-156.475224
        sm.$modal_body.innerHTML = '<img src="' + this_map_url + '" width="530" height="400" />';
        sm.$modal.className = 'modal';
        setTimeout(function () {
            $.addEvent(document, 'keyup', sm.hideModalIf);
        }, 300);
    };

    this.hideModal = function () {

        // remove the binding after we've used it
        $.removeEvent(document, 'keyup', sm.hideModalIf);

        // triggers slide up animation
        sm.$modal.className += ' fade';

        // ensure it gets hidden after the animation
        setTimeout(function () {
            sm.$modal.className += ' hide';
        }, 500);
    };

    this.hideModalIf = function (e) {
        if ($.getEvent(e).keyCode === 27) {
            sm.hideModal();
        }
    };
}
;
function Toggler() {

    this.tableToggle = function() {
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
    };

    this.nextStopsToggle = function() {
        var class_names = this.className.split(/\s+/)
            , active_class = class_names.find('active')
            , me = document.getElementById(this.rel);

        if ($.hasClass(me, 'hidden-phone')) {
            this.className += ' active';
            me.className = '';
        } else {
            me.className = 'hidden-phone hidden-tablet';
            class_names.splice(active_class, 1);
            this.className = class_names.join(' ');
        }
    }
}
;
function BusSchedule() {

    this.schedule = [];
    this.route_name = '';

    this.init = function (route_name) {
        this.route_name = route_name;
        var items_table = document.getElementById(this.route_name + '_table');

        // map out each column and record it as being morning ('AM'), evening ('PM'), or both (['PM','AM'])
        // from here we can tell whether to collapse that whole column when selecting only morning or evening
        // each column is labelled with the class 'loop6-time-cell-0' with the integer being incremented each time
        // i.e. schedule[0] //=> ['AM']
        //      means all cells in the first column ('loop6-time-cell-0') are morning times
        //
        for (var i = 0, row; row = items_table.rows[i]; i++) {

            // start at 1 so we skip the row headers / bus stop name
            for (var ii = 1, col; col = row.cells[ii]; ii++) {

                var cell_index = ii - 1
                    , am_pm = col.innerHTML.replace(/\d+|\s+|:/g, '');

                if (!this.schedule[cell_index]) {
                    this.schedule[cell_index] = [];
                }

                if (am_pm && this.schedule[cell_index].find(am_pm) === -1) {
                    this.schedule[cell_index].push(am_pm);
                }
            }
        }
    };

    this.toggleAM = function (display_value) {
        this.toggler('AM', display_value); // 'table-cell'
        return this;
    };

    this.togglePM = function (display_value) {
        this.toggler('PM', display_value); // 'none'
        return this;
    };

    this.toggler = function (am_pm, display_value) {
        for (var i = 0; i < this.schedule.length; i++) {
            if (this.schedule[i].length === 1 && this.schedule[i][0] === am_pm) {
                for (var t = 0, time_cells = $.findByClass(this.route_name + '-time-cell-' + i); t < time_cells.length; t++) {
                    time_cells[t].style.display = display_value;
                }
            }
        }
    }

}
;
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
// ...






;
