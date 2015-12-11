package com.jsp.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.mongodb.*;

@WebServlet("/AddAmenities")
public class AddAmenities extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter output = response.getWriter();
		MongoClient mongo =null;
		try {
			String amenities = request.getParameter("amenities");
			String roomtype = request.getParameter("roomtype");

			mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("CSP595Project");
			DBCollection Amenities = db.getCollection("Amenities");
			BasicDBObject searchQuery = new BasicDBObject("amenities", amenities);
			DBCursor cursor = Amenities.find(searchQuery);

			if (cursor.hasNext()) {
				
				output.print("<!DOCTYPE html>");
				output.print("<html><head><title>Insert title here</title></head>");
				output.print("<body style=\"background-color:#F2F2F2\">");
				output.print("<div style=\"width:900px;height:57px;margin:0 auto;box-shadow: 0px 0px 99px 9px rgba(0,0,0,0.75);\">");
				output.print("<div style=\"background:#CCFFFF;width:900px;height:57px;float:left;\">");
				output.print("<div align=\"center\"><h2>This Username already exists, Please use another Username!</h2></div></div></div> </body></html>");
				RequestDispatcher rd = request.getRequestDispatcher("AddAmenities.jsp");
				rd.include(request, response);

				}

				else{
					
					BasicDBObject doc = new BasicDBObject("title", "MongoDB")
					.append("roomtype", roomtype)
					.append("amenities", amenities);
					
					Amenities.insert(doc);
				
					output.println("<html>");
					output.println("<head>");
					output.println("<title>Submitted</title>");
					output.println("</head>");
					output.println("<body>");
					output.println(" <h1>Your data has been Sucessfully entered in our system!!</h1>");
					output.println("<hr>");
					output.println("<form method=\"post\" action=\"AdminHome.jsp\">");
					output.println("<input type=\"submit\" value=\"Admin Home\"></input>");
					output.println("</form>");
					output.println("</body>");
					output.println("</html>");
					output.close();
					
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