<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
		<h2>Recent tweets: </h2>
		<%@ page import="com.google.appengine.api.datastore.Entity" %>
		<%@ page import="java.util.List" %>
		<% 
			List<Entity> tweets = (List)request.getAttribute("tweets");	
			if ( tweets.isEmpty() ) {
				out.print("<h3>Currently no tweets</h3>");
			} else {
				for( Entity tweet: tweets ){
					String message = (String) tweet.getProperty("message");
					String tweet_id = (String)tweet.getProperty("key");
					String user = (String) tweet.getProperty("username");
					out.print("<div><h4><a href=/view_tweet.jsp?tweet_id=" + tweet_id + ">" + message + "</a></h4><h5>-<b>" + user + "</b></h5> </div>");
				}
			}
		%>
	</div>
  </body></html>