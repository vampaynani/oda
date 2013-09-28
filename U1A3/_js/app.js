var last = '', dragObj;
var showMsg = false;

$(document).ready(function(){
	$(window).on('resize', function(){
		resizeOda();
	});
	oda();
})