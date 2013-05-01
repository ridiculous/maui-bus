/*!
 * VERSION: 0.1.6
 * DATE: 2013-02-13
 * JavaScript
 * UPDATES AND DOCS AT: http://www.greensock.com/jquery-gsap-plugin/
 *
 * Requires TweenLite version 1.8.0 or higher and CSSPlugin. If TweenMax is loaded, it will be preferred over TweenLite
 * so that you get the most features possible (like repeat, yoyo, repeatDelay, etc.)
 *
 * @license Copyright (c) 2013, GreenSock. All rights reserved.
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for
 * Club GreenSock members, the software agreement that was issued with your membership.
 *
 * @author: Jack Doyle, jack@greensock.com
 */
(function(e){"use strict";var t=e.fn.animate,n=e.fn.stop,r=!0,i,s,o,u=function(e,t){typeof e=="function"&&this.each(e),t()},a=function(e,t,n,r,i){i=typeof i=="function"?i:null,t=typeof t=="function"?t:null;if(!t&&!i)return;r[e]=i?u:n.each,r[e+"Scope"]=n,r[e+"Params"]=i?[t,i]:[t]},f={overwrite:1,delay:1,useFrames:1,runBackwards:1,easeParams:1,yoyo:1,immediateRender:1,repeat:1,repeatDelay:1,autoCSS:1},l=function(e,t){for(var n in f)f[n]&&e[n]!==undefined&&(t[n]=e[n])},c=function(e){return function(t){return e.getRatio(t)}},h={},p=function(){var t=window.GreenSockGlobals||window,n,r,u;i=t.TweenMax||t.TweenLite,i&&(n=(i.version+".0.0").split("."),r=!(Number(n[0])>0&&Number(n[1])>7),t=t.com.greensock,s=t.plugins.CSSPlugin,h=t.easing.Ease.map||{});if(!i||!s||r){i=null,!o&&window.console&&(window.console.log("The jquery.gsap.js plugin requires the TweenMax (or at least TweenLite and CSSPlugin) JavaScript file(s)."+(r?" Version "+n.join(".")+" is too old.":"")),o=!0);return}if(e.easing){for(u in h)e.easing[u]=c(h[u]);p=!1}};e.fn.animate=function(n,o,u,f){n=n||{};if(p){p();if(!i||!s)return t.call(this,n,o,u,f)}if(!r||n.skipGSAP===!0||typeof o=="object"&&typeof o.step=="function"||n.scrollTop!=null||n.scrollLeft!=null)return t.call(this,n,o,u,f);var c=e.speed(o,u,f),d={ease:h[c.easing]||(c.easing===!1?h.linear:h.swing)},v=this,m=typeof o=="object"?o.specialEasing:null,g,y,b,w;for(y in n){g=n[y],g instanceof Array&&h[g[1]]&&(m=m||{},m[y]=g[1],g=g[0]);if(g==="toggle"||g==="hide"||g==="show")return t.call(this,n,o,u,f);d[y.indexOf("-")===-1?y:e.camelCase(y)]=g}if(m){w=[];for(y in m)g=w[w.length]={},l(d,g),g.ease=h[m[y]]||d.ease,y.indexOf("-")!==-1&&(y=e.camelCase(y)),g[y]=d[y];w.length===0&&(w=null)}return b=function(t){if(w){var n=w.length;while(--n>-1)i.to(v,e.fx.off?0:c.duration/1e3,w[n])}a("onComplete",c.old,v,d,t),i.to(v,e.fx.off?0:c.duration/1e3,d)},c.queue!==!1?v.queue(c.queue,b):b(),v},e.fn.stop=function(e,t){n.call(this,e,t);if(i){if(t){var r=i.getTweensOf(this),s=r.length,o;while(--s>-1)o=r[s].totalTime()/r[s].totalDuration(),o>0&&o<1&&r[s].seek(r[s].totalDuration())}i.killTweensOf(this)}return this},e.gsap={enabled:function(e){r=e},version:"0.1.6"}})(jQuery);