function showBusStops(){var e=this.className.split(/\s+/),t=e.find("active"),n=this.rel,r=document.getElementById(n+"_container"),i=document.getElementById(n);return t===-1?(this.className+=" active",i.style.display="none",r.style.display="block"):(e.splice(t,1),this.className=e.join(" "),i.style.display="block",r.style.display="none"),!1}function showStaticMap(){var e="http://maps.googleapis.com/maps/api/staticmap?zoom=16&size=530x400&maptype=roadmap&sensor=false&markers=color:green%7C",t=document.getElementById("mba_modal"),n=document.getElementById("modal_body"),r=this.rel;e+=r,e+="&center="+r,n.innerHTML='<img src="'+e+'" width="530" height="400" />',t.className="modal"}function changeTimeFrame(){var e=this.rel,t=this.parentElement,n=t,r=t,i=Schedules[e];if(!e)return;i||(i=new BusSchedule,i.init(e),Schedules[e]=i),t.className="active";while(r=r.nextSibling)r.className="";while(n=n.previousSibling)n.className="";jUtils.hasClass(this,"morning")?i.toggleAM("table-cell").togglePM("none"):jUtils.hasClass(this,"afternoon")?i.toggleAM("none").togglePM("table-cell"):i.toggleAM("table-cell").togglePM("table-cell")}jUtils.addEvent(window,"load",function(){for(var e=0,t=jUtils.findByClass("time-list");e<t.length;e++)jUtils.addEvent(t[e],"click",showBusStops);jUtils.addEvent(document.getElementById("close_modal"),"click",function(){var e=document.getElementById("mba_modal");e.className+=" fade",setTimeout(function(){e.className+=" hide"},500)});for(var n=0,r=jUtils.findByClass("show-static-map");n<r.length;n++)jUtils.addEvent(r[n],"click",showStaticMap);for(var i=0,s=jUtils.findByClass("time-frame");i<s.length;i++)jUtils.addEvent(s[i],"click",changeTimeFrame);for(var o=0,u=jUtils.findByClass("active");o<u.length;o++)changeTimeFrame.call(u[o].childNodes[0])}),jUtils.addEvent(window,"pageshow",function(){for(var e=0,t=jUtils.findByClass("badge-wrap");e<t.length;e++)t[e].style.display="block"});var Schedules={};