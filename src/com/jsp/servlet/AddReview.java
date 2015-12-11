package com.jsp.servlet;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;

@WebServlet("/AddReview")
public class AddReview extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					
					response.setContentType("text/html");

						PrintWriter output = response.getWriter();
						MongoClient mongo =null;
					
					try{
							mongo = new MongoClient("localhost", 27017);
					
								DB db = mongo.getDB("CSP595Project");

								//now form data
								String roomType = request.getParameter("roomType");
								int price = Integer.parseInt(request.getParameter("price"));
								String cin = request.getParameter("cin");
								String cout = request.getParameter("cout");
								int uRating= Integer.parseInt(request.getParameter("uRating"));
								String reviewText = request.getParameter("reviewText");
								String userName = request.getParameter("userName");
								Date cinDate=null;
								Date coutDate=null;
								
								try{
								SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
								cinDate = sdf.parse(cin);
								coutDate= sdf.parse(cout);
								}
								catch(ParseException pe) {
										System.out.println(pe);
								}
								
								DBCollection reviewAndRating = db.getCollection("reviewAndRating");
								
								BasicDBObject doc = new BasicDBObject("roomType", roomType).
								append("price", price).
								append("cinDate", cinDate).
								append("coutDate", coutDate).
								append("uRating", uRating).
								append("reviewText", reviewText).
								append("userName", userName);
				
								reviewAndRating.insert(doc);

								response.sendRedirect("reservation.jsp");
								
							
					}
					catch (MongoException e) {
						e.printStackTrace();
					}
					
					finally
					{
						mongo.close();
					}
			
		
		
	}
	
}