/**
 * Kind of like ruby's 3.times do .. end method
 * usage: (3).timesDo(function() {} );
 *
 * @param callback {function} to be called however many times
 */
Number.prototype.timesDo=function(e){if(e)for(var t=0;t<this;t++)e.call()},String.prototype.squeeze=function(){return this.replace(/\s+/g,"")},String.prototype.pluralize=function(e){var t="s";return e==1&&(t=""),this+t},Array.prototype.compacted=function(){var e=[];for(var t=0;t<this.length;t++)this[t]!==undefined&&this[t]!==null&&this[t]!==!1&&e.push(this[t]);return e},Array.prototype.find=function(e){var t=-1;for(var n=0;n<this.length;n++)this[n]==e&&(t=n);return t},Array.prototype.findObject=function(e,t){var n=null;for(var r=0;r<this.length;r++)this[r][t]==e&&(n=this[r]);return n},Array.prototype.updateObject=function(e,t,n,r){for(var i=0;i<this.length;i++)if(this[i][t]==r)return this[i][n]=r},Array.prototype.findAndRemove=function(e){for(var t=0;t<this.length;t++)this[t]==e&&this.splice(t,1)},Array.prototype.findAndRemoveObject=function(e,t){for(var n=0;n<this.length;n++)this[n]&&this[n][t]==e&&this.splice(n,1)};