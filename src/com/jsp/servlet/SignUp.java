package com.jsp.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.mongodb.*;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter output = response.getWriter();
		MongoClient mongo=null;
		
		
		try {
			
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String uname = request.getParameter("uname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String birthday = request.getParameter("birthday");
			String address = request.getParameter("address");
			String city = request.getParameter("city");

			mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("CSP595Project");
			DBCollection CustomerAccount = db.getCollection("CustomerAccount");
			BasicDBObject searchQuery = new BasicDBObject("uname", uname);
			DBCursor cursor = CustomerAccount.find(searchQuery);

			if (cursor.hasNext()) {
				
				output.print("<!DOCTYPE html>");
				output.print("<html><head><title>Insert title here</title></head>");
				output.print("<body style=\"background-color:#F2F2F2\">");
				output.print("<div style=\"width:900px;height:57px;margin:0 auto;box-shadow: 0px 0px 99px 9px rgba(0,0,0,0.75);\">");
				output.print("<div style=\"background:#CCFFFF;width:900px;height:57px;float:left;\">");
				output.print("<div align=\"center\"><h2>This Username already exists, Please use another Username!</h2></div></div></div> </body></html>");
				RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
				rd.include(request, response);

				}

				else{
					
					BasicDBObject doc = new BasicDBObject("title", "MongoDB").append("fname", fname)
					.append("lname", lname).append("uname", uname).append("email", email)
					.append("password", password).append("gender", gender).append("email", email)
					.append("birthday", birthday).append("address", address).append("city", city);
					
					CustomerAccount.insert(doc);
				
					response.sendRedirect("ThanksSignup.jsp");
					
					}
				}

				catch (MongoException e) {
					
			e.printStackTrace();
			
		}
		finally{
			mongo.close();
		}
		
	}

}