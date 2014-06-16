$(document).ready(function() {
	var str = $('.curved-text').html();
	var curved = '';
	for (var i = 0, len = str.length; i < len; i++) {
		curved += '<span class="char';
		curved += i;
		curved += '">';
		curved += str[i];
		curved += '</span>';
	}
	$('.curved-text').html(curved);
});