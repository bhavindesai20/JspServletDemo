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
                     &nbsp;&nbsp;&nbsp;Username: <input type="text" name="cname" placeholder=" Your username.."/><br>
                     &nbsp;&nbsp;&nbsp;Password: &nbsp;<input type="password" name="cpassword" placeholder=" Your password.."/><br>
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
				

			<div id="mainContent" style="background-color:#F4EEE2;padding-bottom:20px">
				<p class="titleWord"><span>Standard Room</span>
					<%   
			if(session.getAttribute("f_name") != null){
	  	%>  
                 <span class="bookLink"><a href="MyStandard.jsp">Book This Room</a><span>
			<%}else{%>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>Login for book room!</u>
		 
		<%}%>
         
        </p>
         <ul class="rmGallery">
            <li>
                <img src="images/s1.jpg" />
                <p class="">Image1</p>
            </li>

             <li>
                  
                    <img src="images/s2.jpeg" />
                    <p>Imag2</p>
              </li>

              <li>
                <img src="images/s3.jpg" />
                <p>Image3</p>
              </li>

              <li>
                 <img src="images/s4.jpg" />
                 <p>Image4</p>
              </li>

              <li>
                <img src="images/s5.jpg" />
                <p>Image5</p>
              </li>

              <li>
                <img src="images/s6.jpg" />
                <p>Image6</p>
              </li>
         </ul>

        <p class="commonDescription">
          Stay in downtown Chicago. Great for couples/individual  traveling. Throw open the curtains and admire sweeping 
		  Chicago skyline, Museum Campus and Lake Michigan views from your Chicago accommodations. The unique room 
		  configurations are unlike any of our modern day competitors. Each of our standard rooms features a king-sized 
		  Grand Bed and a generous work area with  Wi-Fi high-speed Internet access as well as a lavish bath with designer 
		  bath products, deep soaker tubs, fluffy towels, coffee makers, mini-fridges, and a fresh, smoke-free environment.
        </p>
		
        
          <p class="titleWord">Amenities</p>
          <ul class="amenities">
            <li>100% non-smoking rooms</li>
            <li>32inches flat-screen television</li>
            <li>Premium cable channels</li>
            <li>Wi-Fi Internet access</li>
            <li>Individual Heat and A/C controls</li>
            <li> Coffee makers</li>
            <li>Iron and Ironing board</li>
            <li>In-room refrigerators</li>
            <li>Oversized work desk with enhanced lighting</li>
            <li>Designer bath products</li>
            <li>Large soaker tubs</li>
            <li>Hair dryer</li>
            <li>Full-length make-up mirrors</li>
            <li>RFID locks and Safes</li>
            <li>Free Valet  Parking</li>

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
