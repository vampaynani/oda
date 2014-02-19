  if (window.dealersjs == null) {
    window.dealersjs = {};
  }

  if ((_base = window.dealersjs).mobile == null) {
    _base.mobile = Mobile = (function() {
      function Mobile() {}

      Mobile.user_agent = navigator.userAgent.toLowerCase();

      Mobile.isIOS = function() {
        if (true === this.isIpad() || true === this.isIphone() || true === this.isIpod()) {
          return true;
        } else {
          return false;
        }
      };

      Mobile.isIpad = function() {
        return this.user_agent.indexOf('ipad') > -1;
      };

      Mobile.isIphone = function() {
        return this.user_agent.indexOf('iphone') > -1;
      };

      Mobile.isIpod = function() {
        return this.user_agent.indexOf('ipod') > -1;
      };

      Mobile.isAndroid = function() {
        return this.user_agent.indexOf('android') > -1;
      };

      Mobile.isMobile = function() {
        return this.user_agent.indexOf('mobile') > -1;
      };

      Mobile;

      return Mobile;

    })();
  }