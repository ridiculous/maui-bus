function Toggler(){this.tableToggle=function(){var e=this.className.split(/\s+/),s=e.find("active"),t=this.rel,i=document.getElementById(t+"_container");return-1===s?(this.className+=" active",i.style.display="block"):(e.splice(s,1),this.className=e.join(" "),i.style.display="none"),!1},this.nextStopsToggle=function(){var e=this.className.split(/\s+/),s=e.find("active"),t=document.getElementById(this.rel);$.hasClass(t,"hidden-phone")?(this.className+=" active",t.className=""):(t.className="hidden-phone hidden-tablet",e.splice(s,1),this.className=e.join(" "))}}