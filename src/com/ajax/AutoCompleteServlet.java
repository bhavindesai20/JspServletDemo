package com.ajax;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.util.HashMap;
import java.util.Iterator;

@WebServlet("/autocomplete")
public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    private ComposerData compData = new ComposerData();
    private HashMap composers = compData.getComposers();

    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {

            if (!targetId.equals("")) {

                Iterator it = composers.keySet().iterator();

                while (it.hasNext()) {
                    String id = (String) it.next();
                    Composer composer = (Composer) composers.get(id);

                    if ( 
                         composer.getFirstName().toLowerCase().startsWith(targetId) ||
                         
                         composer.getLastName().toLowerCase().startsWith(targetId) ||
                         
                         composer.getFirstName().toLowerCase().concat(" ")
                            .concat(composer.getLastName().toLowerCase()).startsWith(targetId)) {

                        sb.append("<composer>");
                        sb.append("<id>" + composer.getId() + "</id>");
                        sb.append("<firstName>" + composer.getFirstName() + "</firstName>");
                        sb.append("<lastName>" + composer.getLastName() + "</lastName>");
                        sb.append("</composer>");
                        namesAdded = true;
                    }
                }
            }

            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<composers>" + sb.toString() + "</composers>");
            }
        }

        if (action.equals("lookup")) {
                if(Integer.parseInt(targetId) == 1 || Integer.parseInt(targetId) == 2 || Integer.parseInt(targetId) == 3){
					response.sendRedirect("Standard.jsp");
			} else if(Integer.parseInt(targetId) == 4 || Integer.parseInt(targetId) == 5 || Integer.parseInt(targetId) == 6){
					response.sendRedirect("Deluxe.jsp");
			} else if(Integer.parseInt(targetId) == 7 || Integer.parseInt(targetId) == 8 || Integer.parseInt(targetId) == 9 ){
					response.sendRedirect("Luxury.jsp");
			}
		}
	}
}
