if(!window.Prototype){Object.extend=function(t,r){for(var n in r)t[n]=r[n];return t};var $A=Array.from=function(t){if(!t)return[];if(t.toArray)return t.toArray();for(var r=[],n=0,e=t.length;e>n;n++)r.push(t[n]);return r};Function.prototype.bind=function(){var t=this,r=$A(arguments),n=r.shift();return function(){return t.apply(n,r.concat($A(arguments)))}};var Class={},Event={observe:function(t,r,n){try{t.addEventListener(r,n,!1)}catch(e){t.attachEvent("on"+r,n)}return t}}}Class.extend=function(t,r){return Object.extend(t.prototype,r.prototype),t.superclass=r,t};