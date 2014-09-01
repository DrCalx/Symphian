SC.initialize({
	client_id: 'e4766e375be7af45b4943567c94f0206',
	redirect_uri: 'http://symphian.com/callbacks/soundcloud.html'
});

$(document).ready(function() {
$('button.sc-connect').click(function(e){
	e.preventDefault();
	SC.connect(function() {
		SC.get('/me', function(me) {
			alert('Hello, ' + me.username);
		});
	});
});
});