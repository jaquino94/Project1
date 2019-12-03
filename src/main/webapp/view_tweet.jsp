<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  <head>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title>Facebook Tweets</title>
  </head>

  <body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href=".">Facebook Tweets</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/tweets">Make a 'tweet'</a></li>
				<li><a href="#">Trending tweets</a></li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<%@ page import="com.google.appengine.api.datastore.*" %>
		<%@ page import="java.util.List" %>
		<% 
			String tweet_id = request.getParameter("tweet_id");
			Entity tweet = null;

			if ( tweet_id == null ) {
				out.println("<H1> TWEET DOES NOT EXIST</H1>");
			} else {
				DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
				Key key = KeyFactory.stringToKey(tweet_id);
				tweet = ds.get(key);

				long count = (Long)tweet.getProperty("views");
				count += 1;
				tweet.setProperty("views", count);
				ds.put(tweet);
			}
		%>
		
		<h3> <%= tweet.getProperty("message") %></h3>
		<h3> Shared media: <a href=<%= tweet.getProperty("url") %>><%= tweet.getProperty("url")%></a></h3>
		<h4> - <%= tweet.getProperty("username") %></h4>
		
	</div>
  </body>
</html>