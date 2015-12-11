package com.jsp.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.mongodb.*;

@WebServlet("/SignIn")
public class SignIn extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		PrintWriter output = response.getWriter();
		MongoClient mongo = null;
		try {
			String cname = request.getParameter("cname");
			String cpassword = request.getParameter("cpassword");
			mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("CSP595Project");
			DBCollection CustomerAccount = db.getCollection("CustomerAccount");
			BasicDBObject searchQuery = new BasicDBObject("uname", cname);
			DBCursor cursor = CustomerAccount.find(searchQuery);
			
			if(cname.equals("admin")&& cpassword.equals("admin"))
			{
				response.sendRedirect("AdminHome.jsp");
				HttpSession session = request.getSession();
				session.setAttribute("f_name", "Admin");
				session.setAttribute("uname", "Admin");
							
			}
			else if(cname.equals("manager")&& cpassword.equals("manager"))
			{
				response.sendRedirect("ManagerHome.jsp");
			}
			else if (cursor.hasNext()) {
				String uname = (String) cursor.one().get("uname");
				String password = (String) cursor.one().get("password");
				String fname = (String) cursor.one().get("fname");


				if (cname.equals(uname) && cpassword.equals(password)) {
				
					HttpSession session = request.getSession();
					session.setAttribute("f_name", fname);
					session.setAttribute("uname", uname);
					response.sendRedirect("Welcome.jsp");
				}

				else

				{
					output.print("<!DOCTYPE html>");
					output.print("<html><head><title>Insert title here</title></head>");
					output.print("<body style=\"background-color:#F2F2F2\">");
					output.print(
							"<div style=\"width:900px;height:57px;margin:0 auto;box-shadow: 0px 0px 99px 9px rgba(0,0,0,0.75);\">");
					output.print("<div style=\"background:red;width:900px;height:57px;float:left;\">");
					output.print(
							"<div align=\"center\"><h2> Specified Password is invalid!</h2></div></div></div> </body></html>");

					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.include(request, response);

				}
			}

			else {
				output.print("<!DOCTYPE html>");
				output.print("<html><head><title>Insert title here</title></head>");
				output.print("<body style=\"background-color:#F2F2F2\">");
				output.print(
						"<div style=\"width:900px;height:57px;margin:0 auto;box-shadow: 0px 0px 99px 9px rgba(0,0,0,0.75);\">");
				output.print("<div style=\"background:#CCCCFF;width:900px;height:57px;float:left;\">");
				output.print(
						"<div align=\"center\"><h2> User name does not exist! </h2></div></div></div> </body></html>");

				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);

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