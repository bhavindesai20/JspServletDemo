

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
			String srnum1=request.getParameter("rnum");
			int rnum1 = Integer.parseInt(srnum1);
			
			
				
			DBCollection CustomerOrder = db.getCollection("CustomerOrder");
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("rnum",rnum1);

			
			
			DBCursor customerCursor = CustomerOrder.find(searchQuery);
							String	uname1=null;
							String	itemID=null;
							String	c_in=null;
							String	c_out=null;
							String	total_people=null;
							String	diff=null;
							String	val=null;
							String	address=null;
							String	city=null;
							String	ccard=null;
							String	cvvnum=null;
							String	futureDate=null;
							String	email=null;
							int	rnum=0;
				while(customerCursor.hasNext())
				{
					BasicDBObject databobj=(BasicDBObject)customerCursor.next();
								
							uname1=databobj.getString("uname");
							itemID=databobj.getString("itemID");
							c_in=databobj.getString("c_in");
							c_out=databobj.getString("c_out");
							total_people=databobj.getString("total_people");
							diff=databobj.getString("diff");
							val=databobj.getString("val");
							address=databobj.getString("address");
							city=databobj.getString("city");
							ccard=databobj.getString("ccard");
							cvvnum=databobj.getString("cvvnum");
							futureDate=databobj.getString("futureDate");
							email=databobj.getString("email");
							rnum=databobj.getInt("rnum");
								
				}
			

%>



			<div id="mainContent">
			<div style="padding-left:40px">
				<form action="UpdatedBooking.jsp" method= "post">
				  <table>
                      <br>
                        <h1>Book Room</h1>

                        <tr>
                            <td><b>User ID:</b></td>
                            <td><input type="text" name="uname"
                                value="<%=uname1%>"  />
                            </td>
                        </tr>

						<tr>
                            <td><b>Room type:</b></td>
                            <td><select name="itemID">
                                    <option value="Standard_Hollywood" selected>Standard_Hollywood</option>
									<option value="Standard_Cabana" selected>Standard_Cabana</option>
									<option value="Standard_Lanai" selected>Standard_Lanai</option>
									<option value="Deluxe_Hollywood">Deluxe_Hollywood</option>
                                    <option value="Deluxe_Cabana">Deluxe_Cabana</option>
									<option value="Deluxe_Lanai">Deluxe_Lanai</option>
									<option value="Luxery_Hollywood">Luxery_Hollywood</option>
									<option value="Luxery_Cabana">Luxery_Cabana</option>
                                    <option value="Luxery_Lanai">Luxery_Lanai</option>
                            </select>
                            </td>
                        </tr>
						 <tr>
                            <td><b>Checkin Date:</b></td>
                            <td><input type="date" name="c_in"  value="<%=c_in%>" required>
                            </td>
                        </tr>
						
						
						<tr>
                            <td><b>Checkout Date:</b></td>
                            <td><input type="date" name="c_out"  value="<%=c_out%>"required>
                            </td>
                        </tr>
						<tr>
						<td><b>Number of people:</b></td>
						<td>
							<select name="total_people">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</td>
						
						</tr>

						<tr>
                            <td><b>Number of days staying in hotel:</b></td>
                            <td><input type="number" name="diff"  value="<%=diff%>" required>
                            </td>
                        </tr>
						
						<tr>
                            <td><b>Price of room:</b></td>
                            <td><input type="number" name="val"  value="<%=val%>"required>
                            </td>
                        </tr>
						<tr>
                            <td><b>Address:</b></td>
                            <td><input type="text" name="address" value="<%=address%>" required>
                            </td>
                        </tr>
						
						<tr>
                            <td><b>City:</b></td>
                            <td><input type="text" name="city"  value="<%=city%>"required>
                            </td>
                        </tr>
						
						<tr>
                            <td><b>Credit card number:</b></td>
                            <td><input type="number" name="ccard"  size="16"  value="<%=ccard%>" required>
                            </td>
                        </tr>
						<tr>
                            <td><b>CVV number:</b></td>
                            <td><input type="text" name="cvvnum"  maxlength="3" size="3"  value="<%=cvvnum%>"required>
                            </td>
                        </tr>
						
						<tr>
                            <td><b>Future Date:</b></td>
                            <td><input type="date" name="futureDate"  value="<%=futureDate%>"required>
                            </td>
                        </tr>
						
                        <tr>
                            <td><b>Email:</b></td>
                            <td><input type="text" name="email"
                                 value="<%=email%>" required />
                            </td>
                        </tr>
                       
					   
						<tr>
							<td>
								<input type="hidden" name="rnum" value="<%=rnum%>"/>
								<input type="Submit" value="Update Booking"/>
								<br><br>
							</td>
						</tr>

                    </table>
		</form>
			</div>	</div>
				
				
				
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
