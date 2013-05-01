/**
 * VERSION: beta 1.2.0
 * DATE: 2013-03-01
 * JavaScript 
 * UPDATES AND DOCS AT: http://www.greensock.com
 *
 * @license Copyright (c) 2008-2013, GreenSock. All rights reserved.
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for 
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 **/
(window._gsQueue||(window._gsQueue=[])).push(function(){"use strict";var e=/(\d|\.)+/g,t={aqua:[0,255,255],lime:[0,255,0],silver:[192,192,192],black:[0,0,0],maroon:[128,0,0],teal:[0,128,128],blue:[0,0,255],navy:[0,0,128],white:[255,255,255],fuchsia:[255,0,255],olive:[128,128,0],yellow:[255,255,0],orange:[255,165,0],gray:[128,128,128],purple:[128,0,128],green:[0,128,0],red:[255,0,0],pink:[255,192,203],cyan:[0,255,255],transparent:[255,255,255,0]},n=function(e,t,n){return e=e<0?e+1:e>1?e-1:e,(e*6<1?t+(n-t)*e*6:e<.5?n:e*3<2?t+(n-t)*(2/3-e)*6:t)*255+.5|0},r=function(r){if(r===""||r==null||r==="none")return t.transparent;if(t[r])return t[r];if(typeof r=="number")return[r>>16,r>>8&255,r&255];if(r.charAt(0)==="#")return r.length===4&&(r="#"+r.charAt(1)+r.charAt(1)+r.charAt(2)+r.charAt(2)+r.charAt(3)+r.charAt(3)),r=parseInt(r.substr(1),16),[r>>16,r>>8&255,r&255];if(r.substr(0,3)==="hsl"){r=r.match(e);var i=Number(r[0])%360/360,s=Number(r[1])/100,o=Number(r[2])/100,u=o<=.5?o*(s+1):o+s-o*s,a=o*2-u;return r.length>3&&(r[3]=Number(r[3])),r[0]=n(i+1/3,a,u),r[1]=n(i,a,u),r[2]=n(i-1/3,a,u),r}return r.match(e)||t.transparent};window._gsDefine.plugin({propName:"colorProps",priority:-1,API:2,init:function(e,t,n){this._target=e;var i,s,o,u;for(i in t){o=r(t[i]),this._firstPT=u={_next:this._firstPT,p:i,f:typeof e[i]=="function",n:i,r:!1},s=r(u.f?e[i.indexOf("set")||typeof e["get"+i.substr(3)]!="function"?i:"get"+i.substr(3)]():e[i]),u.s=Number(s[0]),u.c=Number(o[0])-u.s,u.gs=Number(s[1]),u.gc=Number(o[1])-u.gs,u.bs=Number(s[2]),u.bc=Number(o[2])-u.bs;if(u.rgba=s.length>3||o.length>3)u.as=s.length<4?1:Number(s[3]),u.ac=(o.length<4?1:Number(o[3]))-u.as;u._next&&(u._next._prev=u)}return!0},set:function(e){var t=this._firstPT,n;while(t)n=(t.rgba?"rgba(":"rgb(")+(t.s+e*t.c>>0)+", "+(t.gs+e*t.gc>>0)+", "+(t.bs+e*t.bc>>0)+(t.rgba?", "+(t.as+e*t.ac):"")+")",t.f?this._target[t.p](n):this._target[t.p]=n,t=t._next}})}),window._gsDefine&&window._gsQueue.pop()();