/**
 * VERSION: beta 0.1.1
 * DATE: 2013-03-25
 * JavaScript
 * UPDATES AND DOCS AT: http://www.greensock.com
 *
 * @license Copyright (c) 2008-2013, GreenSock. All rights reserved.
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for 
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 **/
(window._gsQueue||(window._gsQueue=[])).push(function(){"use strict";window._gsDefine.plugin({propName:"directionalRotation",API:2,init:function(e,t,n){typeof t!="object"&&(t={rotation:t}),this.finals={};var r=t.useRadians===!0?Math.PI*2:360,i,s,o,u,a,f,l;for(i in t)i!=="useRadians"&&(f=(t[i]+"").split("_"),s=f[0],l=f[1],o=parseFloat(typeof e[i]!="function"?e[i]:e[i.indexOf("set")||typeof e["get"+i.substr(3)]!="function"?i:"get"+i.substr(3)]()),u=this.finals[i]=typeof s=="string"&&s.charAt(1)==="="?o+parseInt(s.charAt(0)+"1",10)*Number(s.substr(2)):Number(s)||0,a=u-o,l==="short"?(a%=r,a!==a%(r/2)&&(a=a<0?a+r:a-r)):l==="cw"&&a<0?a=(a+r*9999999999)%r-(a/r|0)*r:l==="ccw"&&a>0&&(a=(a-r*9999999999)%r-(a/r|0)*r),this._addTween(e,i,o,o+a,i),this._overwriteProps.push(i));return!0},set:function(e){var t;if(e!==1)this._super.setRatio.call(this,e);else{t=this._firstPT;while(t)t.f?t.t[t.p](this.finals[t.p]):t.t[t.p]=this.finals[t.p],t=t._next}}})._autoCSS=!0}),window._gsDefine&&window._gsQueue.pop()();