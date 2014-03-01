function BusSchedule() {

    this.schedule = [];
    this.route_name = '';

    this.init = function (route_name) {
        this.route_name = route_name;
        var items_table = document.getElementById(this.route_name + '_table')
            , mobile_offset = jUtils.hasClass(document.getElementsByTagName('body')[0], 'mobile') ? 0 : 1;

        // map out each column and record it as being morning ('AM'), evening ('PM'), or both (['PM','AM'])
        // from here we can tell whether to collapse that whole column when selecting only morning or evening
        // each column is labelled with the class 'loop6-time-cell-0' with the integer being incremented each time
        // i.e. schedule[0] //=> ['AM']
        //      means all cells in the first column ('loop6-time-cell-0') are morning times
        //      schedule[5] //=> ['AM', 'PM']
        //      means cells in the sixth column ('loop6-time-cell-5') are both morning and afternoon

        for (var i = 0, row; row = items_table.rows[i]; i++) {

            for (var ii = 0, col; col = row.cells[ii]; ii++) {

                if (jUtils.hasClass(col, 'row-header')) {
                    continue
                }

                var cell_index = ii - mobile_offset
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
                for (var t = 0, time_cells = jUtils.findByClass(this.route_name + '-time-cell-' + i); t < time_cells.length; t++) {
                    time_cells[t].style.display = display_value;
                }
            }
        }
    }

}
