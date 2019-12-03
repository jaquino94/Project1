package com.project1;

import javax.servlet.ServletException;

import java.io.IOException;
import java.util.Date;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.*;


@WebServlet(
    name = "TweetServlet",
    urlPatterns = {"/tweets"}
)
public class TweetServlet extends HttpServlet {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    response.setContentType("text/html");
    response.setCharacterEncoding("UTF-8");
    
    
    request.getRequestDispatcher("Tweet.jsp").forward(request, response);

  }

  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    response.setContentType("text/html");
    response.setCharacterEncoding("UTF-8");
    
    DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
    Entity tweet = new Entity("Tweet");
    if ( request.getParameter("name") != null ) {
		tweet.setProperty("username", request.getParameter("name"));
    } else {
		tweet.setProperty("username", "Anonymous");
    }
    tweet.setProperty("message", request.getParameter("message"));
    tweet.setProperty("url", request.getParameter("link"));
    tweet.setProperty("time", new Date());
    tweet.setProperty("views", 0);
    ds.put(tweet);
    tweet.setProperty("key", KeyFactory.keyToString(tweet.getKey()));
    ds.put(tweet);

    request.getRequestDispatcher("Tweet.jsp").forward(request, response);

  }
}