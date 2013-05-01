/*!
 * VERSION: beta 0.5
 * DATE: 2012-12-20
 * JavaScript 
 * UPDATES AND DOCS AT: http://www.greensock.com
 *
 * @license Copyright (c) 2008-2013, GreenSock. All rights reserved.
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for 
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 */
(window._gsQueue||(window._gsQueue=[])).push(function(){"use strict";window._gsDefine("plugins.CSSRulePlugin",["plugins.TweenPlugin","TweenLite","plugins.CSSPlugin"],function(e,t,n){var r=function(){e.call(this,"cssRule"),this._overwriteProps.length=0},i=window.document,s=n.prototype.setRatio,o=r.prototype=new n;return o._propName="cssRule",o.constructor=r,r.API=2,r.getRule=function(e){var t=i.all?"rules":"cssRules",n=i.styleSheets,r=n.length,s=e.charAt(0)===":",o,u,a,f;e=(s?"":",")+e.toLowerCase()+",",s&&(f=[]);while(--r>-1){u=n[r][t],o=u.length;while(--o>-1){a=u[o];if(a.selectorText&&(","+a.selectorText.split("::").join(":").toLowerCase()+",").indexOf(e)!==-1){if(!s)return a.style;f.push(a.style)}}}return f},o._onInitTween=function(e,t,r){if(e.cssText===undefined)return!1;var s=i.createElement("div");return this._ss=e,this._proxy=s.style,s.style.cssText=e.cssText,n.prototype._onInitTween.call(this,s,t,r),!0},o.setRatio=function(e){s.call(this,e),this._ss.cssText=this._proxy.cssText},e.activate([r]),r},!0)}),window._gsDefine&&window._gsQueue.pop()();