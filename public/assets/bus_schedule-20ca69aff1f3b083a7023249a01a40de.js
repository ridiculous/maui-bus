function BusSchedule(){var e=this;this.schedule=[],this.route_name="",this.init=function(e){this.route_name=e;var t=document.getElementById(this.route_name+"_table");for(var n=0,r;r=t.rows[n];n++)for(var i=1,s;s=r.cells[i];i++){var o=i-1,u=s.innerHTML.replace(/\d+|\s+|:/g,"");this.schedule[o]||(this.schedule[o]=[]),this.schedule[o].find(u)===-1&&this.schedule[o].push(u)}},this.toggleAM=function(e){return this.toggler("AM",e||"table-cell"),this},this.togglePM=function(e){return this.toggler("PM",e||"none"),this},this.toggler=function(e,t){for(var n=0;n<this.schedule.length;n++)if(this.schedule[n].length===1&&this.schedule[n][0]===e)for(var r=0,i=jUtils.findByClass(this.route_name+"-time-cell-"+n);r<i.length;r++)i[r].style.display=t}};