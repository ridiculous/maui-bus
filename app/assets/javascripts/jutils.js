var jUtils = {
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