
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

        <section id="header" style="width:1600px">
          <div style="float:left;padding-top:10px;"><h1>&nbsp;&nbsp;&nbsp;The Grand Bhagwati</h1></div>
            <%   
			if(session.getAttribute("f_name") != null){
	  	%>  
            <div style="float:right;padding-top:20px;padding-right:30px;"> <h2>Hello,&nbsp;&nbsp;<%=uname%> </h2></div>
		<%}%>
        </section> 
        <section style="width:1600px">
        <nav style="width:1600px">
                <ul>
                	<%   
			if(session.getAttribute("f_name") == null){
	  	%>  
                <li><a href="index.jsp">Home</a>
                </li>
				
		<%}
		else{%>
		
			 <li><a href="AdminHome.jsp"> Admin Home</a>
                </li>
		<%	
		}%>
				
				<li><a href="SignUp.jsp">Register Customer</a>
                </li>
                <li><a href="AddRoomBooking.jsp">Make Reservation</a>
                </li>
                
				 </li>
                 <li><a href="SignOut">SignOut</a>
                </li>

				
            </ul>
        </nav></section>

		<section id="pageContent" style="width:1600px">
			<div id="sidebar" class="sidebarr">
			

                	<ul>	
               <li>
                    <h4>About events</h4>
                    <ul style="padding-left:10px;">
                  Chicago's Top New Year's Eve Event
					Chicago is going to host an outdoor New Year's Eve party like never before! 
                    </ul>
                </li>
                </ul>
			
			</div>
			
			<div id="mainContent" style="width:1000px">
<div style="padding-left:40px">
		<%
		
		response.setContentType("text/html");
		String title= null;
		//String ArticleContent=null;
		String doc=null;
		
		PrintWriter output = response.getWriter();
		MongoClient mongo = new MongoClient("localhost", 27017);
		DB db = mongo.getDB("CSP595Project");
			
			// If the collection does not exists, MongoDB will create it for you
			DBCollection CustomerOrder = db.getCollection("CustomerOrder");
			
			DBCursor customerCursor = CustomerOrder.find();
			
			//generate a table
			String customerDetail="<table border=1>"+
								"<b><tr style=\"color:#fff; background:#010F42\">"+
								"<td >UserID</td>"+
								"<td >Room type</td>"+
								"<td >CheckIn Date</td>"+
								"<td >CheckOut Date</td>"+
								"<td >No of people Type</td>"+
								"<td >No of days</td>"+
								"<td >Room price</td>"+
								"<td >Address</td>"+
								"<td >City</td>"+
								"<td >Creditcard Info</td>"+
								"<td >CVV</td>"+
								"<td >Future Date</td>"+
								"<td >Email</td>"+
								"<td >Ref No</td>"+
								"<td >Remove</td><td >Update</td></tr></b>";
			while (customerCursor.hasNext()) {
							BasicDBObject obj=(BasicDBObject)customerCursor.next();
											
									String uname1=obj.getString("uname");
									
									if(uname1 != null){
									int rnum=obj.getInt("rnum");
									String cDRow= "<tr >"+
								"<td >"+obj.getString("uname")+"</td>"+
								"<td >"+obj.getString("itemID")+"</td>"+
								"<td >"+obj.getString("c_in")+"</td>"+
								"<td >"+obj.getString("c_out")+"</td>"+
								"<td >"+obj.getString("total_people")+"</td>"+
								"<td >"+obj.getString("diff")+"</td>"+
								"<td >"+obj.getString("val")+"</td>"+
								"<td >"+obj.getString("address")+"</td>"+
								"<td >"+obj.getString("city")+"</td>"+
								"<td >"+obj.getString("ccard")+"</td>"+
								"<td >"+obj.getString("cvvnum")+"</td>"+
								"<td >"+obj.getString("futureDate")+"</td>"+
								"<td >"+obj.getString("email")+"</td>"+
								"<td >"+obj.getString("rnum")+"</td>"+
								"<td >"+
								"<form  action=\"DeletedBooking.jsp\" style=\"display:inline;\">"+
								"<input type=\"hidden\" name=\"rnum\" value=\""+rnum+"\" />"+
								"<input type=\"submit\" value=\"Delete\" />"+
								"</form>"+
								"</td><td><form  action=\"UpdateBooking.jsp\" style=\"display:inline;\">"+
								"<input type=\"hidden\" name=\"rnum\" value=\""+rnum+"\" /><input type=\"submit\" value=\"Update\" />"+
								"</form></td></tr>";
								customerDetail+=cDRow;
									}
			}
			
			customerDetail+="</table>";
			title="Customer";
%>			
		
				<p class="titleWord">Welcome Admin</p>
				<Br/>
		<%=customerDetail%>
		<br/>
		<br/>
		</div>
			</div>	
				
				
				
			<div style="clear:both;"></div>

		</section>

		<section id="pageFooter" style="width:1600px">
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
