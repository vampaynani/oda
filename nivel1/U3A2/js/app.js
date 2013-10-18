var oda = new U3A2();
$(document).ready(function(){
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})