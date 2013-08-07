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
