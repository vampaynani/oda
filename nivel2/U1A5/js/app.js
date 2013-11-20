var oda = new U5A5();
$(document).ready(function(){
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})