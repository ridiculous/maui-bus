/**
 * Kind of like ruby's 3.times do .. end method
 * usage: (3).timesDo(function() {} );
 *
 * @param callback {function} to be called however many times
 */
function BusSchedule(){var e=this;this.schedule=[],this.route_name="",this.init=function(e){this.route_name=e;var t=document.getElementById(this.route_name+"_table");for(var n=0,r;r=t.rows[n];n++)for(var i=1,s;s=r.cells[i];i++){var o=i-1,u=s.innerHTML.replace(/\d+|\s+|:/g,"");this.schedule[o]||(this.schedule[o]=[]),this.schedule[o].find(u)===-1&&this.schedule[o].push(u)}},this.toggleAM=function(e){return this.toggler("AM",e||"table-cell"),this},this.togglePM=function(e){return this.toggler("PM",e||"none"),this},this.toggler=function(e,t){for(var n=0;n<this.schedule.length;n++)if(this.schedule[n].length===1&&this.schedule[n][0]===e)for(var r=0,i=jUtils.findByClass(this.route_name+"-time-cell-"+n);r<i.length;r++)i[r].style.display=t}}function showBusStops(){var e=this.className.split(/\s+/),t=e.find("active"),n=this.rel,r=document.getElementById(n+"_container"),i=document.getElementById(n);return t===-1?(this.className+=" active",i.style.display="none",r.style.display="block"):(e.splice(t,1),this.className=e.join(" "),i.style.display="block",r.style.display="none"),!1}function showStaticMap(){var e="http://maps.googleapis.com/maps/api/staticmap?zoom=16&size=530x400&maptype=roadmap&sensor=false&markers=color:green%7C",t=document.getElementById("mba_modal"),n=document.getElementById("modal_body"),r=this.rel;e+=r,e+="&center="+r,n.innerHTML='<img src="'+e+'" width="530" height="400" />',t.className="modal"}function changeTimeFrame(){var e=this.rel,t=this.parentElement,n=t,r=t,i=Schedules[e];if(!e)return;i||(i=new BusSchedule,i.init(e),Schedules[e]=i),t.className="active";while(r=r.nextSibling)r.className="";while(n=n.previousSibling)n.className="";jUtils.hasClass(this,"morning")?i.toggleAM("table-cell").togglePM("none"):jUtils.hasClass(this,"afternoon")?i.toggleAM("none").togglePM("table-cell"):i.toggleAM("table-cell").togglePM("table-cell")}Number.prototype.timesDo=function(e){if(e)for(var t=0;t<this;t++)e.call()},String.prototype.squeeze=function(){return this.replace(/\s+/g,"")},String.prototype.pluralize=function(e){var t="s";return e==1&&(t=""),this+t},Array.prototype.compacted=function(){var e=[];for(var t=0;t<this.length;t++)this[t]!==undefined&&this[t]!==null&&this[t]!==!1&&e.push(this[t]);return e},Array.prototype.find=function(e){var t=-1;for(var n=0;n<this.length;n++)this[n]==e&&(t=n);return t},Array.prototype.findObject=function(e,t){var n=null;for(var r=0;r<this.length;r++)this[r][t]==e&&(n=this[r]);return n},Array.prototype.updateObject=function(e,t,n,r){for(var i=0;i<this.length;i++)if(this[i][t]==r)return this[i][n]=r},Array.prototype.findAndRemove=function(e){for(var t=0;t<this.length;t++)this[t]==e&&this.splice(t,1)},Array.prototype.findAndRemoveObject=function(e,t){for(var n=0;n<this.length;n++)this[n]&&this[n][t]==e&&this.splice(n,1)};var jUtils={addEvent:function(e,t,n){e.addEventListener?e.addEventListener(t,n):e.attachEvent?e.attachEvent("on"+t,function(){n.call(this.target||this.event.srcElement)}):e[t]=n},findByClass:function(e){return document.getElementsByClassName?document.getElementsByClassName(e):document.querySelectorAll("."+e)},hasClass:function(e,t){return e.classList?e.classList.contains(t):e.className.split(/\s+/).find(t)!==-1}};jUtils.addEvent(window,"load",function(){for(var e=0,t=jUtils.findByClass("time-list");e<t.length;e++)jUtils.addEvent(t[e],"click",showBusStops);jUtils.addEvent(document.getElementById("close_modal"),"click",function(){var e=document.getElementById("mba_modal");e.className+=" fade",setTimeout(function(){e.className+=" hide"},500)});for(var n=0,r=jUtils.findByClass("show-static-map");n<r.length;n++)jUtils.addEvent(r[n],"click",showStaticMap);for(var i=0,s=jUtils.findByClass("time-frame");i<s.length;i++)jUtils.addEvent(s[i],"click",changeTimeFrame);for(var o=0,u=jUtils.findByClass("active");o<u.length;o++)changeTimeFrame.call(u[o].childNodes[0])}),jUtils.addEvent(window,"pageshow",function(){for(var e=0,t=jUtils.findByClass("badge-wrap");e<t.length;e++)t[e].style.display="block"});var Schedules={};