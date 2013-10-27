var oda = new U5A4();
$(document).ready(function(){
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})