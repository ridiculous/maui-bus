/**
 * VERSION: beta 1.4.0
 * DATE: 2013-02-27
 * JavaScript (ActionScript 3 and 2 also available)
 * UPDATES AND DOCS AT: http://www.greensock.com
 *
 * @license Copyright (c) 2008-2013, GreenSock. All rights reserved.
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for 
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 **/
(window._gsQueue||(window._gsQueue=[])).push(function(){"use strict";var e=window._gsDefine.plugin({propName:"roundProps",priority:-1,API:2,init:function(e,t,n){return this._tween=n,!0}}),t=e.prototype;t._onInitAllProps=function(){var e=this._tween,t=e.vars.roundProps instanceof Array?e.vars.roundProps:e.vars.roundProps.split(","),n=t.length,r={},i=e._propLookup.roundProps,s,o,u;while(--n>-1)r[t[n]]=1;n=t.length;while(--n>-1){s=t[n],o=e._firstPT;while(o)u=o._next,o.pg?o.t._roundProps(r,!0):o.n===s&&(this._add(o.t,s,o.s,o.c),u&&(u._prev=o._prev),o._prev?o._prev._next=u:e._firstPT===o&&(e._firstPT=u),o._next=o._prev=null,e._propLookup[s]=i),o=u}return!1},t._add=function(e,t,n,r){this._addTween(e,t,n,n+r,t,!0),this._overwriteProps.push(t)}}),window._gsDefine&&window._gsQueue.pop()();