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

		<section id="pageContent">
			<div id="sidebar" class="sidebarr">
			<%   
			if(session.getAttribute("f_name") == null){
	  	%>  
               <ul>	
               <li>
                    <h4>Login</h4>
                    <ul>
                    <form  method="post" action="SignIn">
                     &nbsp;&nbsp;&nbsp;Username: <input type="text" name="cname" placeholder=" Your username.."required/><br>
                     &nbsp;&nbsp;&nbsp;Password: &nbsp;<input type="password" name="cpassword" placeholder=" Your password.."required/><br>
                     &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"/>
                     </form>
                    </ul>
                </li>
                </ul>
				
				
                	<ul>	
               <li>
                    <h4>About events</h4>
                    <ul style="padding-left:10px;">
                  Chicago's Top New Year's Eve Event
					Chicago is going to host an outdoor New Year's Eve party like never before! 
                    </ul>
                </li>
                </ul>

				
		<%}
		else{%>
		
		
                	<ul>	
               <li>
                    <h4>About events</h4>
                    <ul style="padding-left:10px;">
                  Chicago's Top New Year's Eve Event
					Chicago is going to host an outdoor New Year's Eve party like never before! 
                    </ul>
                </li>
                </ul>
		<%	
		}%>
			            
			</div>
				

			<div id="mainContent">
		<div style="padding-left:200px;padding-top:20px;padding-bottom:40px;background-image:url(images/stan.jpg);background-repeat:no-repeat;">
		<h2 style="color:white">Book Standard Room</h2>
		<form action="nextStep.jsp" method="post">
        <table id="mytable" cellspacing="15">
      
          <tr>
            <td style="color:white" class="left"><label for="Name"> <strong>User ID: </label></td>
            <td class="right"><input name="uID" placeholder="Enter UserID.." type="text"required></td>
          </tr>
          <tr>
            <td style="color:white" class="left"><label for="Phone"><strong>Phone: </label></td>
            <td class="right"><input name="cphone" placeholder="Enter Phone number.." type="text"required></td>
          </tr>
          <tr>
            <td style="color:white" class="left"><label for="City"><strong>City: </label></td>
            <td class="right"><input name="ccity" placeholder="Enter city name.." type="text"required></td>
          </tr>
          <tr>
            <td style="color:white" class="left"><label for="State"><strong>State: </label></td>
            <td class="right"><input name="cstate" placeholder="Enter state name.." type="text"required></td>
          </tr>
          <tr>
            <td style="color:white"  class="left"><label for="ZIP"><strong>ZIP: </label></td>
            <td class="right"><input name="czip" placeholder="Enter zip code.." type="text"required></td>
          </tr>
       
          <tr>
            <td style="color:white" class="left"><label for="itemID"><strong>Type of room: </label></td>
			 <td class="right">
			               <select name="itemID">
                                    <option value="Standard_Hollywood" selected>Standard_Hollywood</option>
                                    <option value="Standard_Cabana">Standard_Cabana</option>
                                    <option value="Standard_Lanai">Standard_Lanai</option>
                           </select>
			</td>
          
          </tr>
          <tr>
            <td style="color:white" class="left"><label for="c_in"><strong>Checkin Date: </label></td>
            <td class="right"><input name="c_in" id="c_in" value="" type="date"required></td>
          </tr>
          <tr>
            <td style="color:white" class="left"><label for="c_out"><strong>Checkout Date: </label></td>
            <td class="right"><input name="c_out" id="c_out" value="" type="date"required></td>
          </tr>
          <tr>
            <td style="color:white" class="left"><label for="total_people"><strong>Number of Person: </label></td>
            <td class="right"><select name="total_people">
                <option value="1"selected>1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select></td>
          </tr>
          
          
          <tr>
            <td class="left"><a href="customer_login.html">
              <div class="h3_a"><b></b></div>
              </a></td>
            <td class="right"><h3><input class="formbutton" value="Next" type="submit"></td>
         </tr>
        </table>
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
