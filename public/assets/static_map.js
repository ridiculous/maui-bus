/**
 * usage:
 *
 * var SM = new StaticMap();
 * jUtils.addEvent(jUtils.findByClass('show-static-map'), 'click', SM.init);
 * jUtils.addEvent(document.getElementById('close_modal'), 'click', SM.hideModal);
 * @constructor
 */
function StaticMap(){var e=this;this.$modal=document.getElementById("mba_modal"),this.$modal_body=document.getElementById("modal_body"),this.map_url="http://maps.googleapis.com/maps/api/staticmap?zoom=16&size=530x400&maptype=roadmap&sensor=false&markers=color:green%7C",this.init=function(){var t=this.rel,n=e.map_url;n+=t,n+="&center="+t,e.$modal_body.innerHTML='<img src="'+n+'" width="530" height="400" />',e.$modal.className="modal",setTimeout(function(){jUtils.addEvent(document,"keyup",e.hideModalIf)},300)},this.hideModal=function(){jUtils.removeEvent(document,"keyup",e.hideModalIf),e.$modal.className+=" fade",setTimeout(function(){e.$modal.className+=" hide"},500)},this.hideModalIf=function(t){jUtils.getEvent(t).keyCode===27&&e.hideModal()}};