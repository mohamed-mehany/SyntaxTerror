//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-wysihtml5

$(document).ready(function(){
	$('.wysihtml5').each(function(i, elem) {
		$(elem).wysihtml5();
	});
});
