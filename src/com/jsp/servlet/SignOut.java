package com.jsp.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SignOut")
public class SignOut extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter output = response.getWriter();
		HttpSession session = request.getSession();
		session.invalidate();
		//output.print("<!DOCTYPE html>");
		//output.print("<html><head><title>Insert title here</title></head>");
		output.print("<div style=\"background-color:white;margin-bottom;20px;\">");
		output.print("<div style=\"width:900px;height:57px;margin:0 auto;box-shadow: 0px 0px 99px 9px rgba(0,0,0,0.75);\">");
		output.print("<div style=\"background:#CCCCFF;width:900px;height:57px;float:left;\">");
		output.print("<div align=\"center\"><h2>You are Successfully signed out!</div></div></div> </div>");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.include(request,response);		
		output.close();

	}

}
