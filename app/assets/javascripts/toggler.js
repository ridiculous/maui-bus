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

        if (jUtils.hasClass(me, 'hidden-phone')) {
            this.className += ' active';
            me.className = '';
        } else {
            me.className = 'hidden-phone hidden-tablet';
            class_names.splice(active_class, 1);
            this.className = class_names.join(' ');
        }
    }
}