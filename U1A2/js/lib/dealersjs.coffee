window.dealersjs ||= {}

dealersjs.mobile =
	user_agent: navigator.userAgent.toLowerCase()
	isIOS: ->
		if @isIpad() or @isIphone() or @isIpod()
			true
		else
			false
	isIpad: ->
		@user_agent.indexOf('ipad') > -1
	isIphone: ->
		@user_agent.indexOf('iphone') > -1
	isIpod: ->
		@user_agent.indexOf('ipod') > -1
	isAndroid: ->
		@user_agent.indexOf('android') > -1
	isMobile: ->
		@user_agent.indexOf('mobile') > -1