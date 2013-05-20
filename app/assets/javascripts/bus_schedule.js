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
