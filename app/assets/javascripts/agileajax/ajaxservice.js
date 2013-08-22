/**

Copyright (c) 2009 Matthew E. Foster

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/
var AjaxService = function(url, iMethod, iSync){
	
	AjaxService.superclass.call(this, null);
	
	var params = {}, requestHeader = {}, cache = {}, queue = [];
	var method = "";
	var self = this, transactionFlag = false, timeoutDuration = false, timeout = false, cacheEnabled = false, synchronous = iSync, historyInstance = false;
	var stateArr = ['uninitialized', 'loading', 'loaded', 'interactive', 'complete'];
	this.registerEvents( ["success", "failure", "exception", "timeout"].concat(stateArr));
	this.setMethod = function(meth){
		method = meth;
		if(method.toUpperCase() == "POST")
			this.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	};
	this.enableHistory = function(dom){
		var history = this.createHistory(dom);		
		history.enable();
	};
	this.disableHistory = function(){
		var history = this.createHistory();
		history.disable();		
	};
	this.createHistory = function(dom){
		if(!historyInstance){
			historyInstance = new AjaxHistory(this);
			historyInstance.on('change', self.send);			
		}
		return historyInstance;
	}
	this.enableCache = function(){
		cacheEnabled = true;
	};
	this.disableCache = function(){
		cacheEnabled = false;		
	};
	this.setParams = function(prm){
		params = prm;
	};
	this.setTimeout = function(num){
		timeoutDuration = num; 
	};
	this.setSynchronous = function(bool){
		synchronous = bool;
	};
	this.getTimeout = function(){
		return timeoutDuration;
	};
	this.setRequestHeader = function(name, value){
		requestHeader[name] = value;
	};
	this.send = function(prm){
		if(synchronous && transactionFlag)
			queueRequest(url, prm || params, method);
		else
			request(url, prm || params, method);
	}
	
	function queueRequest(iUrl, iPrm, iMethod){
		queue.push({ url : iUrl, params : iPrm, method : iMethod});
	}
	function serializeQueryString(obj){
		var arr = [];
		
		if(typeof obj == "string")
			return obj;			
		for(var i in obj)
			arr.push(encodeURIComponent(i) + "=" + encodeURIComponent(obj[i]));
		return arr.join("&");
	}
	function isSuccess(status){
		return (status >= 200 && status < 300);
	}
	function request(iUrl, prm, iMethod){
		transactionFlag = true;
		var params = serializeQueryString(prm);
		var cacheKey = [iMethod, iUrl, params].join("");
		
		if(cacheEnabled && cache[cacheKey]){
			dispatchFromCache(cacheKey);
			//var xhr = cache[cacheKey];
			//handleStateChange(xhr, cacheKey);
			return true;			
		}
		var xhr = getXHR();		
		xhr.onreadystatechange = handleStateChange.bind(self, xhr, cacheKey);
		if(iMethod.toLowerCase() == "get" && params.length > 0)
			iUrl += "?" + params;			
		xhr.open(iMethod, iUrl, true);
		setRequestHeaders(xhr);
		xhr.parameters = params;
		self.dispatchEvent("uninitialized", xhr);

		xhr.send(params);

		if(timeoutDuration)
			startTimeout(xhr);
	}
	function startTimeout(xhr){
		xhr.timeout = setTimeout(handleTimeout.bind(this, xhr), timeoutDuration);
	}
	function setRequestHeaders(myXhr){
		for(var i in requestHeader)
			myXhr.setRequestHeader(i, requestHeader[i]);	
	}
	function handleStateChange(xhr, key){
		var state = stateArr[xhr.readyState];
		
		try{
			if(state == "complete"){
				clearTimeout(xhr.timeout);
				transactionFlag = false;
				if(cacheEnabled && !cache[key])
					cache[key] = xhr;				
			}			
			this.dispatchEvent(state, xhr);
			if(state == "complete" && isSuccess(xhr.status))
				this.dispatchEvent("success", xhr);
			else if(state == "complete" && !isSuccess(xhr.status))
				this.dispatchEvent("failure", xhr);			
			if(state == "complete" && synchronous && queue.length > 0){
				var tmp = queue.shift();
				request(tmp.url, tmp.params, tmp.method);			
			}
		}
		catch(e){
			this.dispatchEvent("exception", e);
		}
	}
	function handleTimeout(xhr){
		try{
			xhr.abort();
			this.dispatchEvent("timeout", xhr);
			}
		catch(e){
			xhr.exception = e;
			this.dispatchEvent("exception", xhr);
		}
	};
	function dispatchFromCache(key){
		var xhr = cache[key];
		setTimeout(function(){
			try{
				self.dispatchEvent("complete", xhr);
				self.dispatchEvent("success", xhr);
			}
			catch(e){
				self.dispatchException("exception", xhr, e);
			}
		}, 50);		
	}
	function isIE()
	{
		return /msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent);
    }
	
	var getXHR = function(){
		try{
			return new XMLHttpRequest();
		}
		catch(e){
			try{
				return new ActiveXObject('Msxml2.XMLHTTP')
			}
			catch(e2){
				return new ActiveXObject('Microsoft.XMLHTTP')
			}
		}
	}
	this.setMethod(iMethod || "POST");
	this.getRawXHR = getXHR;
	
};

try{
Class.extend(AjaxService, EventDispatcher);
}
catch(e){
	alert("Failed to extend class " + e.message);
}