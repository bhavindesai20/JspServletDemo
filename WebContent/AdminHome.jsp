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
				
		




			<div id="mainContent">
			<div style="padding-left:40px">
			<p class="titleWord">Welcome Admin</p><br/>
			
			<div style="color:Red;">Note: Admin Please Create this Database only for the first time!</div>
					
			<p class="bookLink"><a style="margin-left:0px;" href="RoomData.jsp">Create Order Database</a><p>
			<hr>
			
			<strong>Admin can Add numerous customers as well as view, update and Delete existing Customers!!</strong>
					<form method="post" action="SignUp.jsp">
					<h4><input type="submit" Value="Add Customer"/></h4>
					</form>
				
					<form method="post" action="ViewCustomer.jsp">
					<h4><input type="submit" Value="View/Update/Delete Customer"/></h4>
					</form>
			<hr>	
			<strong>Admin can book Rooms and Amenities as well as view, update and Delete Room booking!!</strong>
					<form method="post" action="AddRoomBooking.jsp">
					<h4><input type="submit" Value=" Book Room"/></h4>
					</form>
				
					<form method="post" action="ViewRoomBooking.jsp">
					<h4><input type="submit" Value="View/Update/Delete Room Booking"/></h4>
					</form>
				
					<form method="post" action="AddAmenities.jsp">
					<h4><input type="submit" Value="Add Amenities"/></h4>
					</form>
				</div>
		
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
