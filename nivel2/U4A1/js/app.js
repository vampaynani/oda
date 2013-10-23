var oda = new U4A1();
$(document).ready(function(){
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})