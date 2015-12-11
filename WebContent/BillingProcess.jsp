<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.mongodb.*" %>
<%   
      if(session.getAttribute("f_name") == null){
		 
              response.sendRedirect("index.jsp");
      }
      String name=(String)session.getAttribute("f_name");
      String uname = (String)session.getAttribute("uname");   
	  
    %>
	<%	
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String itemID = request.getParameter("itemID");
		String c_in = request.getParameter("c_in");
		String c_out = request.getParameter("c_out");
		String total_people = request.getParameter("total_people");
		String diff = request.getParameter("diff");
		String val = request.getParameter("val");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String ccard = request.getParameter("ccard");
		String cvvnum = request.getParameter("cvvnum");
		String email = request.getParameter("email");
		String mnum = request.getParameter("mnum");
		Date sdate = dateFormat.parse(c_in);
		
		Calendar cldr = Calendar.getInstance(); 
		cldr.setTime(sdate); 
		cldr.add(Calendar.DATE, -5);
		Date newDate = cldr.getTime();
		String futureDate = dateFormat.format(newDate);
		
		//Generating confirmation number for customer that can be used later to cancel order
		Random num = new Random();
		int rnum = num.nextInt(9000000) + 1000000;
		%>
		
		<%
		
		
		MongoClient mongo = new MongoClient("localhost", 27017);
		DB db = mongo.getDB("CSP595Project");
		DBCollection CustomerOrder = db.getCollection("CustomerOrder");
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("uname", uname)
		.append("itemID", itemID).append("c_in", c_in).append("c_out", c_out)
		.append("total_people", total_people).append("diff", diff).append("val", val)
		.append("address", address).append("city",city).append("ccard",ccard).append("cvvnum",cvvnum)
		.append("futureDate", futureDate).append("email",email).append("rnum",rnum);
		
		CustomerOrder.insert(doc); %>
	
		<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>The Grand Bhagwati</title>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

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

        <section id="carouselForFront">
            <img src="images/lux.jpg" alt="">
        </section>

		<div style="padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:20px;background-color:#F4EEE2;">
		<h2>Your <%=itemID%> Room has been booked sucessfully.&nbsp;Congratulations!!!</h2>
		<hr>
		<h3>Your  Check In date is&nbsp;<%= c_in %>&nbsp;and last date to cancel a booking is:&nbsp;<%= futureDate %>.</h3>
		<h4>Confirmation number for this order is:&nbsp;<b style="background-color:yellow;"><%= rnum %></b>.&nbsp;Keep this confirmation  saved in a safe place, with that you can cancel your booking no later then&nbsp;<%= futureDate %>.</h4>
		
		<form  action="Welcome.jsp">
		<input type="submit" value="Home"></input>
		</form>		
		</div>

      <div style="clear:both;"></div>

		</section>


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


