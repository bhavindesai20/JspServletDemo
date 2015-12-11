<!DOCTYPE html>
<html lang="en">
<%   
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

        <section id="carouselForFront">
            <img src="images/5.jpg" alt="">
        </section>

        

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
                     &nbsp;&nbsp;&nbsp;Username: <input type="text" name="cname" placeholder=" Your username.." required/><br>
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
				
				 	<ul>	
               <li>
                    <h4>News</h4>
                    <ul style="padding-left:10px;">
                 <marquee>Check out our career section for job opening!</marquee>
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
				
				 	<ul>	
               <li>
                    <h4>News</h4>
                    <ul style="padding-left:10px;">
                 <marquee>Check out our career section for job opening!</marquee>
                    </ul>
		<%	
		}%>
			               
			</div>
				
		




			<div id="mainContent" style="background-color:#F4EEE2;padding-bottom:20px">
        <p class="titleWord">Choose Your Room Type</p>
        <p class="commonDescription">
        Here You can Explore about our room type and aeminities included with that room. 
        You can see feedback about the room too by clicking view-feedback button below to each room type block.
        </p>
				 <ul class="rmtype">

            <li>
              <p class="">Standard</p>
              <a href="Standard.jsp">
                <img src="images/1.jpg" />
              </a>
			  <form action="Standard.jsp">
			  		<button type="submit">Book Room</a>
			  	</form>
			  <form action="addFeedback.jsp">
			  	<button type="submit">Add Feedback</a>
			  </form>
              <form action="ViewReview.jsp">
              	  <input type="hidden" name="rType" value="std" />
                  <button type="submit">View Feedback</button>
              </form>

            </li>

              <li>
                <p>Deluxe</p>
                <a href="Deluxe.jsp">
                  <img src="images/d3.jpg" />
                </a>
				<form action="Deluxe.jsp">
			  		<button type="submit">Book Room</a>
			  	</form>
                <form action="addFeedback.jsp">
			  		<button type="submit">Add Feedback</a>
			  	</form>
                <form action="ViewReview.jsp">
                  <input type="hidden" name="rType" value="del" />
                  <button type="submit">View Feedback</button>
                </form>
              </li>

              <li>
                <p>Luxury</p>
                <a href="Luxury.jsp">
                  <img src="images/3.jpg" />
                </a>
				<form action="Luxury.jsp">
			  		<button type="submit">Book Room</a>
			  	</form>
                <form action="addFeedback.jsp">
			  		<button type="submit">Add Feedback</a>
			  	</form>
                <form action="ViewReview.jsp">
                  <input type="hidden" name="rType" value="lux" />
                  <button type="submit">View Feedback</button>
                </form>
              </li>

         </ul>

        <div style="clear:both;"></div>
			</div>
  
      <div style="clear:both;"></div>

		</section>


		<section id="pageFooter">
			<div style="height:100px;">
		<table style="width:100%">
			<br>
			  <tr>
			    <td><a href="index.jsp">| Home |</a>
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
