var oda;
$(document).ready(function(){
	oda = new window[$('title').text()]()
	$(window).on('resize', function(){
		oda.resize();
	});
	oda.initialize();
})