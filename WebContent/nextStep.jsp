<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.mongodb.*" %>

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
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	String itemID = request.getParameter("itemID");
	String c_in = request.getParameter("c_in");
	String c_out = request.getParameter("c_out");
	String total_people = request.getParameter("total_people");

	
	Date sdate = dateFormat.parse(c_in);
	Date fdate = dateFormat.parse(c_out);
	
	int diff = fdate.getDate() - sdate.getDate();
	int val = 0;

	if(itemID.equals("Standard_Hollywood")){
		val=diff*100;
	} 
	else if(itemID.equals("Standard_Cabana")){
		val=diff*150;
    }
    else if(itemID.equals("Standard_Lanai")){
		val=diff*200;
    }
    else if(itemID.equals("Deluxe_Hollywood")){
		val=diff*250;
    }
    else if(itemID.equals("Deluxe_Cabana")){
		val=diff*300;
    }
    else if(itemID.equals("Deluxe_Lanai")){
		val=diff*350;
    }
    else if(itemID.equals("Luxary_Hollywood")){
		val=diff*400;
    }
    else if(itemID.equals("Luxary_Cabana")){
		val=diff*450;
    }
    else if(itemID.equals("Luxary_Lanai")){
		val=diff*500;
    }
    else
    {
		val=diff*100;
	}
	
	MongoClient mongo = new MongoClient("localhost", 27017);
	DB db = mongo.getDB("CSP595Project");
	DBCollection CustomerOrder = db.getCollection("CustomerOrder");
	BasicDBObject searchQuery = new BasicDBObject("itemID", itemID);
	DBCursor cursor = CustomerOrder.find(searchQuery);
	int curSize=cursor.size();
	int nullCheck=0;
	

%>


			<div style="padding-top:10px;padding-left:30px;padding-right:30px;padding-bottom:40px;">
		    
<%
			int checkAvailability=0;
			if(curSize != nullCheck){
			
			while (cursor.hasNext()) {
				
				BasicDBObject obj = (BasicDBObject)cursor.next();
				String checkin = obj.getString("c_in");
				Date scheckin = dateFormat.parse(checkin);
				String checkout = obj.getString("c_out");
				Date scheckout = dateFormat.parse(checkout);
				
				if((scheckin.compareTo(sdate)<=0) && (fdate.compareTo(scheckout)<=0)){ 
				    checkAvailability+=1;
				%>

				

				
			<%
			
			}
				else{ 
					checkAvailability=0;
				
				%>

			<%	
				}
  }
  if(checkAvailability < 1)
  {
	  %>
	  
	  <h2>Proceed Next..</h2><hr>	
			<h3 style="background-color:#09144A;color:white;padding-left:10px;">You have selected <%=itemID%> room for <%=diff%> days! Total Price is $<%=val%>.</h3>			
			<form method="post" action="BillingProcess.jsp">
			<table>
				<tr>
					<td><b>Selected Room Type:</b></td>
					<td><%=itemID%></td>
				</tr>
				<tr>
					<td><b>Checked In date:<b></td>
					<td><%=c_in%></td>
				</tr>
				<tr>
					<td><b>Checked Out date:<b></td>
					<td><%=c_out%></td>
				</tr>
				<tr>
					<td><b>Total Stay:<b></td>
					<td><%=diff%> days</td>
				</tr>
				<tr>
					<td><b>Total Person:<b></td>
					<td><%=total_people%></td>
					<tr><td></td></tr>
				</table><div><hr></div>
						
				<input type="hidden" name="itemID"  value="<%=itemID%>"/>
				<input type="hidden" name="c_in"  value="<%=c_in%>"/>
				<input type="hidden" name="c_out"  value="<%=c_out%>"/>
				<input type="hidden" name="total_people"  value="<%=total_people%>"/>
				<input type="hidden" name="diff"  value="<%=diff%>"/>
				<input type="hidden" name="val"  value="<%=val%>"/>
					<table>					
                        <tr>
                            <td><b>Address:</b></td>
                            <td><input type="text" name="address"  placeholder="  Enter address.." required />
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
                            <td><b>Credit Card:</b></td>
                            <td><input type="number" name="ccard"  placeholder="  Enter creditcard number.." required />
                            </td>
                        </tr>
						
						<tr>
                            <td><b>CVV:</b></td>
                            <td><input type="number" name="cvvnum"  placeholder="  Enter CVV number.." required />
                            </td>
                        </tr>
						
						<tr>
                            <td><b>Email</b></td>
                            <td><input type="text" name="email"  placeholder="  Enter email.." required />
                            </td>
                        </tr>	
						
						<tr>
                            <td><b>Mobile Number</b></td>
                            <td><input type="number" name="mnum"  placeholder="  Enter mobile num.." required />
                            </td>
                        </tr>

			</table>
			<br><h3><input type="submit" value="Checkout" /></h3>

			</form>
	  
	  <%
  }
  else
  {
	  %>
	  
	  <h2>Please select another Date range since selected date is occupied!!</h2>
	  
	  <%
  }
  
  
}
  
  else{				%>
   
				<h2>Order Database is not created yet by the Admin! Go to Admin Login and create Order Datebase first! Thanks! </h2>
				
  <%}%>
			
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
