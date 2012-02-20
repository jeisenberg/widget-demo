
//=require jquery.tokeninput.js

$(function() {
	$("input#post_user_token").tokenInput("/users.json",
	{
		crossDomain:false,
		theme:'facebook',
		hintText:"Type a name"
	});
});