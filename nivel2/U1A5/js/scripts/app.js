$(document).ready(function(){
	oda = new window[$('title').text()]()
	$(window).on('resize', function(){
		oda.resize();
	});
	if( oda.initialize ) oda.initialize();
})