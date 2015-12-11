package com.jsp.servlet;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	
	public void init() throws ServletException{
    	
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aname=request.getParameter("aname");
		String apassword=request.getParameter("apassword");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try{
			if(aname.equals("admin")&& apassword.equals("admin"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
				rd.include(request,response);
				
			}
			else if(aname.equals("manager")&& apassword.equals("manager"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("ManagerHome.jsp");
				rd.include(request,response);
			}
			else{
				out.print("<!DOCTYPE html>");
				out.print("<html><head><title>Insert title here</title></head>");
				out.print("<body style=\"background-color:#F2F2F2\">");
				out.print("<div style=\"width:900px;height:57px;margin:0 auto;box-shadow: 0px 0px 99px 9px rgba(0,0,0,0.75);\">");
				out.print("<div style=\"background:#CCCCFF;width:900px;height:57px;float:left;\">");
				out.print("<div align=\"center\"><h2> Wrong Username and Password!</h2></div></div></div></body></html>");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
			}
				
		} 
		catch (Exception e) {
				e.printStackTrace();
		}
	}

	
	public void destroy(){
      // do nothing.
	}
	
}