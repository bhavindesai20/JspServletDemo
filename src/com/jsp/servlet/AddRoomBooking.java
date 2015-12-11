package com.jsp.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.mongodb.*;

@WebServlet("/AddRoomBooking")
public class AddRoomBooking extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter output = response.getWriter();
		MongoClient mongo =null;
		try {
			String uname = request.getParameter("uname");
			String itemID = request.getParameter("itemID");
			String c_in = request.getParameter("c_in");
			String c_out = request.getParameter("c_out");
			String total_people = request.getParameter("total_people");
			int diff = Integer.parseInt(request.getParameter("diff"));
			int val=Integer.parseInt(request.getParameter("val"));
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			int ccard=Integer.parseInt(request.getParameter("ccard"));
			String cvvnum = request.getParameter("cvvnum");
			String futureDate = request.getParameter("futureDate");
			String email = request.getParameter("email");
			int rnum=Integer.parseInt(request.getParameter("rnum"));

			mongo = new MongoClient("localhost", 27017);
			DB db =  mongo.getDB("CSP595Project");
			DBCollection CustomerOrder = db.getCollection("CustomerOrder");
			BasicDBObject searchQuery = new BasicDBObject("uname", uname);
			DBCursor cursor = CustomerOrder.find(searchQuery);

			if (cursor.hasNext()) {
				
				output.print("<!DOCTYPE html>");
				output.print("<html><head><title>Insert title here</title></head>");
				output.print("<body style=\"background-color:#F2F2F2\">");
				output.print("<div style=\"width:900px;height:57px;margin:0 auto;box-shadow: 0px 0px 99px 9px rgba(0,0,0,0.75);\">");
				output.print("<div style=\"background:#CCFFFF;width:900px;height:57px;float:left;\">");
				output.print("<div align=\"center\"><h2>This Username already exists, Please use another Username!</h2></div></div></div> </body></html>");
				RequestDispatcher rd = request.getRequestDispatcher("AddRoomBooking.jsp");
				rd.include(request, response);

				}

				else{
					
					BasicDBObject doc = new BasicDBObject("title", "CustomerOrder")
					.append("uname", uname)
					.append("itemID", itemID)
					.append("c_in", c_in)
					.append("c_out", c_out)
					.append("total_people",total_people)
					.append("diff", diff)
					.append("val", val)
					.append("address", address)
					.append("city", city)
					.append("ccard", ccard)
					.append("cvvnum", cvvnum)
					.append("futureDate", futureDate)
					.append("email", email)
					.append("rnum", rnum);
					
					CustomerOrder.insert(doc);
				
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