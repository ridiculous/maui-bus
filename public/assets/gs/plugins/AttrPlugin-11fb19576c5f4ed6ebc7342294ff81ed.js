/*!
 * VERSION: 0.1.0
 * DATE: 2013-02-22
 * JavaScript 
 * UPDATES AND DOCS AT: http://www.greensock.com
 *
 * @license Copyright (c) 2008-2013, GreenSock. All rights reserved.
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for 
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 */
(window._gsQueue||(window._gsQueue=[])).push(function(){"use strict";window._gsDefine.plugin({propName:"attr",API:2,init:function(e,t,n){var r;if(typeof e.setAttribute!="function")return!1;this._target=e,this._proxy={};for(r in t)this._addTween(this._proxy,r,parseFloat(e.getAttribute(r)),t[r],r),this._overwriteProps.push(r);return!0},set:function(e){this._super.setRatio.call(this,e);var t=this._overwriteProps,n=t.length,r;while(--n>-1)r=t[n],this._target.setAttribute(r,this._proxy[r]+"")}})}),window._gsDefine&&window._gsQueue.pop()();