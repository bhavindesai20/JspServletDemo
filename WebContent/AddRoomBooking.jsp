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
                <!--li><a href="reservation.jsp">Make Reservation</a>
                </li-->
                
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
			
			<div id="mainContent" >
			<div style="padding-left:80px">
			<form action="AddRoomBooking" method="post">
			  <table >
                      <br>
                        <h1 >Book Room</h1>

                        <tr>
                            <td><b>Username:</b></td>
                            <td><input type="text" name="uname"
                                placeholder="User name.." required />
                            </td>
                        </tr>
						<tr>
                            <td><b>Room type:</b></td>
                            <td><select name="itemID">
                                    <option value="Standard_Hollywood" selected>Standard_Hollywood</option>
									<option value="Standard_Cabana">Standard_Cabana</option>
									<option value="Standard_Lanai" >Standard_Lanai</option>
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
                            <td><input type="date" name="c_in" required/>
                            </td>
                        </tr>
						
						
						<tr>
                            <td><b>Checkout Date:</b></td>
                            <td><input type="date" name="c_out" required/>
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
                            <td><input type="number" name="diff" required/>
                            </td>
                        </tr>
						
						<tr>
                            <td><b>Price of room:</b></td>
                            <td><input type="number" name="val" required/>
                            </td>
                        </tr>
						<tr>
                            <td><b>Address:</b></td>
                            <td><input type="text" name="address" required>
                            </td>
                        </tr>
						
						<tr>
                            <td><b>City:</b></td>
                            <td><input type="text" name="city" required/>
                            </td>
                        </tr>
						
						<tr>
                            <td><b>Credit card number:</b></td>
                            <td><input type="number" name="ccard"  size="16" required/>
                            </td>
                        </tr>
						<tr>
                            <td><b>CVV number:</b></td>
                            <td><input type="number" name="cvvnum"  maxlength="3" size="3"required/>
                            </td>
                        </tr>
						
						<tr>
                            <td><b>Last cancel Date:</b></td>
                            <td><input type="date" name="futureDate" required/>
                            </td>
                        </tr>
						
                        <tr>
                            <td><b>Email:</b></td>
                            <td><input type="text" name="email"
                                placeholder="  Email address.." required />
                            </td>
                        </tr>
                       
					   
                        <tr>
                            <td><b>Confirmation Number:</b></td>
                            <td><input type="number" name="rnum" required />
                            </td>
                        </tr>
                       
                    </table>
					<br>
					<input type="submit" value="Add Room Booking" />
					<br><br><br>
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
		</form>
		 </div>


		    		<div style="height:100px;text-align:center">
		&#169;&nbsp; All Rights Reserved by THe Grand Bhagwati<br><br>
		Guided by<b> Atef Bader</b>
		    </div>
		</section>	
		   
</body>

</html>
