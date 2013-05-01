/**
 * VERSION: 1.1.0
 * DATE: 2013-02-28
 * JavaScript 
 * UPDATES AND DOCS AT: http://www.greensock.com
 * 
 * This file is to be used as a simple template for writing your own plugin. See the 
 * notes at http://api.greensock.com/js/com/greensock/plugins/TweenPlugin.html for more details.
 *
 * You can start by doing a search for "yourCustomProperty" and replace it with whatever the name
 * of your property is. This way of defining a plugin was introduced in version 1.9.0 - previous versions
 * of TweenLite won't work with this.
 *
 * @license Copyright (c) 2008-2013, GreenSock. All rights reserved.
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for 
 * Club GreenSock members, the software agreement that was issued with your membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 **/
(window._gsQueue||(window._gsQueue=[])).push(function(){"use strict";window._gsDefine.plugin({propName:"yourCustomProperty",priority:0,API:2,version:"1.0.0",overwriteProps:["yourCustomProperty"],init:function(e,t,n){return this._target=e,this._addTween(e,"scaleX",e.scaleX,t,"scaleX",!1),this._addTween(e,"scaleY",e.scaleY,t,"scaleY",!1),this._alphaStart=e.alpha,this._alphaChange=t.alpha-e.alpha,!0},set:function(e){this._super.setRatio.call(this,e),this._target.alpha=this._alphaStart+this._alphaChange*e}})}),window._gsDefine&&window._gsQueue.pop()();