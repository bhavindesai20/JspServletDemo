

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
          <div style="float:left;padding-top:10px;"><h1>&nbsp;&nbsp;&nbsp;The Grand Bhagwati</h1></div>
            <%   
			if(session.getAttribute("f_name") != null){
	  	%>  
            <div style="float:right;padding-top:20px;padding-right:30px;"> <h2> </h2></div>
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

		<section id="pageContent">
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
				
		
<%
				MongoClient mongo = new MongoClient("localhost", 27017);
				DB db = mongo.getDB("CSP595Project");
			String email = request.getParameter("email");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String uname1 = request.getParameter("uname");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String birthday  = request.getParameter("birthday");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
					
			
				
			DBCollection CustomerAccount = db.getCollection("CustomerAccount");
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("uname",uname1);

			
			
			DBCursor customerCursor = CustomerAccount.find(searchQuery);
			
				while(customerCursor.hasNext())
				{
					BasicDBObject databobj=(BasicDBObject)customerCursor.next();
									email=databobj.getString("email");
									//String myDataSegment= "<tr >"+
								email=databobj.getString("email");
								fname=databobj.getString("fname");
								lname=databobj.getString("lname");
								uname1=databobj.getString("uname");
								password=databobj.getString("password");
								gender=databobj.getString("gender");
								birthday=databobj.getString("birthday");	
								address=databobj.getString("address");
								city=databobj.getString("city");
								
				}
			

%>



			<div id="mainContent">
				<form action="UpdatedCustomer.jsp" method= "post">
				  <table>
                      <br>
                        <h1 style="padding-left: 20px;">Update an account</h1>

                        <tr>
                            <td><b>First name:</b></td>
                            <td><input type="text" name="fname" value="<%=fname%>"
                                placeholder="  First name.." required />
                            </td>
                        </tr>

                        <tr>
                            <td><b>Last name:</b></td>
                            <td><input type="text" name="lname"
                                value="<%=lname%>" required />
                            </td>
                        </tr>

                        <tr>
                            <td><b>User name:</b></td>
                            <td><input type="text" name="uname"
                                value="<%=uname1%>" required />
                            </td>
                        </tr>

                        <tr>
                            <td><b>Email:</b></td>
                            <td><input type="text" name="email"
                                value="<%=email%>" required />
                            </td>
                        </tr>
                       

                        <tr>
                            <td><b>Password:</b></td>
                            <td><input type="password" name="password"
                                 value="<%=password%>" required />
                            </td>
                        </tr>
						                        
                        <tr>
                            <td><b>Gender:</b></td>
                            <td><input type="radio" name="gender"
                                value="male" checked>Male</input>&nbsp;<input
                                type="radio" name="gender" value="female">Female</input>
                            </td>
                        </tr>


                        <tr>
                            <td><b>Birthdate:</b></td>
                            <td><input type="date" name="birthday"  value="<%=birthday%>" required>
                            </td>
                        </tr>


                        <tr>
                            <td><b>Address:</b></td>
                            <td><input type="text" name="address"
                                 value="<%=address%>" required />
                            </td>
                        </tr>

                        <tr>
                            <td><b>City:</b></td>
                            <td><select name="city">
                                    <option value="Chicago" selected>Chicago</option>
                                    <option value="Newyork">Newyork</option>
                                    <option value="Dallas">Dallas</option>
                                    <option value="Las Vegas">Las Vegas</option>
                                    <option value="Washington">Washington</option>
                            </select>
                            </td>
                        </tr>
						<tr>
							<td>
								<input type="hidden" name="email" value="<%=email%>"/>
								<input type="Submit" value="Update"/>
							</td>
						</tr>

                    </table>
		</form>
			</div>	
				
				
				
			<div style="clear:both;"></div>

		</section>

		<section id="pageFooter">
			<div style="height:100px;">
		<table style="width:100%">
			<br>
			  <tr>
			    <td><a href="AdminHome.jsp">|Admin Home |</a></td>
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
