/**
 * VERSION: beta 1.7.0
 * DATE: 2013-02-27
 * JavaScript
 * UPDATES AND DOCS AT: http://www.greensock.com
 *
 * @license Copyright (c) 2008-2013, GreenSock. All rights reserved.
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for 
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 **/
(window._gsQueue||(window._gsQueue=[])).push(function(){"use strict";var e=document.documentElement,t=window,n=function(n,r){var i=r==="x"?"Width":"Height",s="scroll"+i,o="client"+i,u=document.body;return n===t||n===e||n===u?Math.max(e[s],u[s])-Math.max(e[o],u[o]):n[s]-n["offset"+i]},r=window._gsDefine.plugin({propName:"scrollTo",API:2,init:function(e,r,i){return this._wdw=e===t,this._target=e,this._tween=i,typeof r!="object"&&(r={y:r}),this._autoKill=r.autoKill!==!1,this.x=this.xPrev=this.getX(),this.y=this.yPrev=this.getY(),r.x!=null?this._addTween(this,"x",this.x,r.x==="max"?n(e,"x"):r.x,"scrollTo_x",!0):this.skipX=!0,r.y!=null?this._addTween(this,"y",this.y,r.y==="max"?n(e,"y"):r.y,"scrollTo_y",!0):this.skipY=!0,!0},set:function(e){this._super.setRatio.call(this,e);var n=this._wdw||!this.skipX?this.getX():this.xPrev,r=this._wdw||!this.skipY?this.getY():this.yPrev,i=r-this.yPrev,s=n-this.xPrev;this._autoKill&&(!this.skipX&&(s>7||s<-7)&&(this.skipX=!0),!this.skipY&&(i>7||i<-7)&&(this.skipY=!0),this.skipX&&this.skipY&&this._tween.kill()),this._wdw?t.scrollTo(this.skipX?n:this.x,this.skipY?r:this.y):(this.skipY||(this._target.scrollTop=this.y),this.skipX||(this._target.scrollLeft=this.x)),this.xPrev=this.x,this.yPrev=this.y}}),i=r.prototype;r.max=n,i.getX=function(){return this._wdw?t.pageXOffset!=null?t.pageXOffset:e.scrollLeft!=null?e.scrollLeft:document.body.scrollLeft:this._target.scrollLeft},i.getY=function(){return this._wdw?t.pageYOffset!=null?t.pageYOffset:e.scrollTop!=null?e.scrollTop:document.body.scrollTop:this._target.scrollTop},i._kill=function(e){return e.scrollTo_x&&(this.skipX=!0),e.scrollTo_y&&(this.skipY=!0),this._super._kill.call(this,e)}}),window._gsDefine&&window._gsQueue.pop()();