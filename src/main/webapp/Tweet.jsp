<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Facebook Tweets</title>
</head>
<body>
	<script>
		function statusChangeCallback(response){
			console.log("LOGGED IN");
			if ( response.status === 'connected' ) {
				postMessageTest();
			}
		}
		
		function postMessageTest(){
			if ( document.getElementById('link').value !== '') {
				FB.ui(
					{
						method: 'share',
						href: document.getElementById('link').value,
						quote: document.getElementById('message').value,
						redirect_uri: 'https://apps.facebook.com/707554869732964',
					},
					function(response) {
						 if (response) {
							 console.log("GOT A RESPONSE BACK");
						 } 
					 }
				);
			}
		}

		function checkLoginState() {               // Called when a person is finished with the Login Button.
				FB.getLoginStatus(function(response) {   // See the onlogin handler
					statusChangeCallback(response);
				});
			}
		
		window.fbAsyncInit = function() {
				FB.init({
					appId      : '707554869732964',
					cookie     : false,
					xfbml      : true,
					version    : 'v4.0'
				});
				FB.AppEvents.logPageView();
				FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
						 statusChangeCallback(response);        // Returns the login status.
					});
			};
			

			(function(d, s, id){
				 var js, fjs = d.getElementsByTagName(s)[0];
				 if (d.getElementById(id)) {
					 return;
				 }

				 js = d.createElement(s); 
				 js.id = id;
				 js.src = "https://connect.facebook.net/en_US/sdk.js";
				 fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
	</script>


	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href=".">Facebook Tweets</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/tweets">Make a 'tweet'</a></li>
				<li><a href="#">Send a 'tweet' to a friend</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<form method="post" action="tweets">
			<div class="form-group">
					<b>Link to share:</b> <input id="link" type="text" name="link" value=""><br>
			</div>
			<div class="form-group">
					<b>Message:</b> <input id="message" type="text" name="message" value=""><br>
			</div>
				<button type="submit" class="btn btn-default" onclick="checkLoginState()">Submit</button>
		</form>
	</div>
	</body>
</html>