package com.project1;

import javax.servlet.ServletException;

import java.io.IOException;
import java.util.Date;
import java.util.List;

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
    tweet.setProperty("Message", request.getParameter("message"));
    tweet.setProperty("Shared URL", request.getParameter("link"));
    tweet.setProperty("Time", new Date());
    ds.put(tweet);

    request.getRequestDispatcher("Tweet.jsp").forward(request, response);

  }
}