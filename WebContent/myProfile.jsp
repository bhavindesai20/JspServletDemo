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
				 </li>
                 <li><a href="SignOut">SignOut</a>
                </li>
				 


            </ul>
        </nav></section>


	
		
		<section id="pageContent">
<br><br>
<%
		
		MongoClient mongo = new MongoClient("localhost", 27017);
		DB db = mongo.getDB("CSP595Project");
		DBCollection CustomerAccount = db.getCollection("CustomerAccount");
		

		BasicDBObject searchQuery = new BasicDBObject("uname", uname);
		DBCursor cursor = CustomerAccount.find(searchQuery);
		
					
	if (cursor.hasNext()) {
				
								
				String fname = "";
				String lname = "";
				String email = "";
				String password = "";
				String gender = "";
				String birthday = "";
				String address = "";
				String city = "";
	
					
				BasicDBObject obj = (BasicDBObject) cursor.next();
				fname = obj.getString("fname");
				lname = obj.getString("lname");
				email = obj.getString("email");
				password = obj.getString("password");
				gender = obj.getString("gender");
				birthday = obj.getString("birthday");
				address = obj.getString("address");
				city = obj.getString("city");

				%>
				
				<div style="padding-left:50px;">
				<h1>Your Profile Information</h1>
				
				<table>
				<tr>
				<td>Firstname:</td>
				<td><%= fname %> </td>
				</tr>
				<tr>
				<td>Lastname:</td>
				<td><%= lname %> </td>
				</tr>
				<tr>
				<td>Email:</td>
				<td><%= email %> </td>
				</tr>
				<tr>
				<td>Password:</td>
				<td><%= password %> </td>
				</tr>
				<tr>
				<td>Gender:</td>
				<td><%= gender %> </td>
				</tr>
				<tr>
				<td>Birthday:</td>
				<td><%= birthday %> </td>
				</tr>
				<tr>
				<td>Address:</td>
				<td><%= address %> </td>
				</tr>
				<tr>
				<td>City:</td>
				<td><%= city %> </td>
				</tr>
				<tr>
				</table>				
				<h3 style="color:red;"> Want to change your profile information? </h3>
				
				<form action="editProfile.jsp">
				<input type="submit" value="Edit Profile"/>
				</form><br><br>
				
				</div>
				
				</section>
	<%}
	
				
				%>

		<section id="pageFooter">
			<div style="height:100px;">
		<table style="width:100%">
			<br>
			  <tr>
			    <td><a href="Welcome.jsp">| Home |</a></td>
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
