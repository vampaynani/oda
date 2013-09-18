var mobiled = {
	ua: navigator.userAgent.toLowerCase(),
	isIOS: function(){
		if( this.isIpad || this.isIphone || this.isIpod) return true;
		else return false;
	},
	isIpad: function(){
		if( this.ua.indexOf('ipad') > -1 ) return true;
		else return false;
	},
	isIphone: function(){
		if( ua.indexOf('iphone') > -1 ) return true;
		else return false;
	},
	isIpod: function(){
		if( this.ua.indexOf('ipod') > -1 ) return true;
		else return false;
	},
	isAndroid: function(){
		if( this.ua.indexOf("android") > -1 ) return true;
		else return false;
	},
	isMobile: function(){
		if( this.ua.indexOf('mobile') > -1 ) return true;
		else return false;	
	}
}