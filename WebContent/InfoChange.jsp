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
<%@ page import="java.io.*" %>
<%@ page import="com.mongodb.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*"%>
<body>
    <div id="container">

        <section id="header">
          <div style="float:left;padding-top:10px;"><h1>&nbsp;&nbsp;&nbsp;The Grand Bhagwati</h1></div>
          <div style="float:right;padding-top:20px;padding-right:30px;"> <h2></h2></div>
        </section> 
        <section>
        <nav>
             <ul>
                <li><a href="index.jsp">Home</a>
                </li>
				<li><a href="About.jsp">About US</a>
                </li>
				<li><a href="SignUp.jsp">Sign Up</a>
                </li>
                <li><a href="reservation.jsp">Make Reservation</a>
                </li>
                <li><a href="Contact.jsp">Contact Us</a>
                </li>
                <li><a href="Careers.jsp">Careers</a>
                </li>
				 </li>
                 <li><a href="SignOut">SignOut</a>
                </li>
				 


            </ul>
        </nav></section>
<%
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String birthday = request.getParameter("birthday");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("CSP595Project");
			DBCollection CustomerAccount = db.getCollection("CustomerAccount");
			BasicDBObject searchQuery = new BasicDBObject("uname", uname);
			DBCursor cursor = CustomerAccount.find(searchQuery);
			if (cursor.hasNext()) {			
			CustomerAccount.update(searchQuery, new BasicDBObject("$set", new BasicDBObject("fname", fname)));
			CustomerAccount.update(searchQuery,new BasicDBObject("$set", new BasicDBObject("lname", lname)));
			CustomerAccount.update(searchQuery,new BasicDBObject("$set", new BasicDBObject("email", email)));
			CustomerAccount.update(searchQuery,new BasicDBObject("$set", new BasicDBObject("password", password)));
			CustomerAccount.update(searchQuery,new BasicDBObject("$set", new BasicDBObject("gender", gender)));
			CustomerAccount.update(searchQuery,new BasicDBObject("$set", new BasicDBObject("birthday", birthday)));
			CustomerAccount.update(searchQuery,new BasicDBObject("$set", new BasicDBObject("address", address)));
			CustomerAccount.update(searchQuery, new BasicDBObject("$set", new BasicDBObject("city", city)));
			response.sendRedirect("myProfile.jsp");			
			}%>

		<section id="pageContent">

				  </section>

		<section id="pageFooter">
			<div style="height:100px;">
		<table style="width:100%">
			<br>
			  <tr>
			    <td><a href="Welcome.jsp">| Home |</a></td>
			    <td><a href="About.jsp">| About Us |</a></td>
			    <td><a href ="SignUp.jsp">| Sign Up |</a></td>
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
