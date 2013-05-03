var jUtils = {
    addEvent: function (el, event_name, callback) {
        if (el.addEventListener) {
            el.addEventListener(event_name, callback);
        } else if (el.attachEvent) {
            el.attachEvent('on' + event_name, function() {
                callback.call(this.target || this.event.srcElement);
            });
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
    },
    hasClass: function (elem, class_name) {
        if (elem.classList) {
            return elem.classList.contains(class_name);
        } else {
            return elem.className.split(/\s+/).find(class_name) !== -1;
        }
    }
};