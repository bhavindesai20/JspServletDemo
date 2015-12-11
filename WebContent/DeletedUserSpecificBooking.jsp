
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.MongoException"%>
<%@ page import="com.mongodb.WriteConcern"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.ServerAddress"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.MongoException"%>
<%@ page import="com.mongodb.WriteConcern"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.ServerAddress"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="en">

<%   
      if(session.getAttribute("f_name") == null){
		 
              response.sendRedirect("index.jsp");
      }
      String name=(String)session.getAttribute("f_name");
      String uname = (String)session.getAttribute("uname");     
    %>
<head>
    <meta charset="UTF-8">
    <title>The Grand Bhagwati</title>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
    <div id="container">

        <section id="header">
          <div style="float:left;padding-top:10px;color:white;text-shadow: 3px -2px #0A2BCE;"><h1>&nbsp;&nbsp;&nbsp;The Grand Bhagwati</h1></div>
          <%   
            if(session.getAttribute("f_name") != null){
          %>  
            <div style="float:right;padding-top:20px;padding-right:30px;"> <h2>Hello,&nbsp;&nbsp;<%=uname%> </h2></div>
        <%}%>
        </section> 
        <section>
        <nav>
               <ul>
                    <%   
            if(session.getAttribute("f_name") == null){
        %>  
                <li><a href="index.jsp">Home</a>
                </li>
                
        <%}
        else{%>
        
             <li><a href="Welcome.jsp">Home</a>
                </li>
        <%  
        }%>
                <li><a href="About.jsp">About US</a>
                </li>
                <%   
            if(session.getAttribute("f_name") == null){
        %>  
                <li><a href="SignUp.jsp">Sign Up</a>
                </li>
        <%}%>
                <li><a href="reservation.jsp">Make Reservation</a>
                </li>
                <li><a href="Contact.jsp">Contact Us</a>
                </li>
                <li><a href="Careers.jsp">Careers</a>
                </li>
                <%   
            if(session.getAttribute("f_name") != null){
        %>  
                <li><a href="editProfile.jsp">Edit Profile</a>
                </li>
        <%}%>
                <%   
            if(session.getAttribute("f_name") != null){
        %>  
                <li><a href="SignOut">SignOut</a>
                </li>
        <%}%>
                
            </ul>
        </nav></section>

		
<%
			MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("CSP595Project");
			String srnum1=request.getParameter("rnum");
			int rnum1 = Integer.parseInt(srnum1);
			// If the collection does not exists, MongoDB will create it for you
			DBCollection CustomerOrder = db.getCollection("CustomerOrder");
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("rnum",rnum1);
			CustomerOrder.remove(searchQuery); 
%>


				<div style="background-color:#9FACD4;height:200px;padding-top:10px;padding-left:20px;padding-right:20px;">
				<h1 style="color:white;"> Thanks you! Order:&nbsp;<%=rnum1%> booking has been Deleted sucessfully!!</i></h1>
				
				
				<form method="post" action="ViewAndUpdateUserOrder.jsp">
					<h3><input type="submit" Value="View Your Booking"/></h3>
					</form>
					
			 </div>
				
				
				
			<div style="clear:both;"></div>

		</section>

		<section id="pageFooter">
			<div style="height:100px;">
		<table style="width:100%">
			<br>
			  <tr>
			    <td><a href="AdminHome.jsp">| Admin Home |</a></td>
			    <td><a href="About.jsp">| About Us |</a></td>
			    <td><a href="Careers.jsp">| Careers |</a></td>
			    <td><a href="Contact.jsp">| Contact Us |</a></td>
			 </tr>
		</table>
		 </div>


		    		<div style="height:100px;text-align:center">
		&#169;&nbsp; All Rights Reserved by THe Grand Bhagwati<br><br>
		Guided by<b> Atef Bader</b>
		    </div>
		</section>	
		   
</body>

</html>