// Generated by CoffeeScript 1.6.3
(function() {
  window.dealersjs || (window.dealersjs = {});

  dealersjs.mobile = {
    user_agent: navigator.userAgent.toLowerCase(),
    isIOS: function() {
      if (this.isIpad() || this.isIphone() || this.isIpod()) {
        return true;
      } else {
        return false;
      }
    },
    isIpad: function() {
      return this.user_agent.indexOf('ipad') > -1;
    },
    isIphone: function() {
      return this.user_agent.indexOf('iphone') > -1;
    },
    isIpod: function() {
      return this.user_agent.indexOf('ipod') > -1;
    },
    isAndroid: function() {
      return this.user_agent.indexOf('android') > -1;
    },
    isMobile: function() {
      return this.user_agent.indexOf('mobile') > -1;
    }
  };

}).call(this);
