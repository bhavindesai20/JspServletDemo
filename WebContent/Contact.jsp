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
	
	<script	src="https://maps.googleapis.com/maps/api/js"> </script>
	<script> var myCenter=new google.maps.LatLng(41.831755,-87.6294847);

	function initialize()
	{
		var mapProp = {
			center:myCenter,
			zoomControl:true,
			zoom:17,
			mapTypeId:google.maps.MapTypeId.ROADMAP
		};

		var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

		var marker=new google.maps.Marker({
			position:myCenter,
		});

		marker.setMap(map);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	</script>


</head>

<body>
<style>

</style>
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
                    <h4> Hotel Address</h4>
                    <ul style="padding-left:10px;">
                  3300 S Federal St, Chicago, IL 60616<br>
				  Phone: (312) 567-3000
                    </ul>
                </li>
                </ul>
		
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
				
		<%}
		else{%>
		
		<ul>	
               <li>
                    <h4> Hotel Address</h4>
                    <ul style="padding-left:10px;">
                  3300 S Federal St, Chicago, IL 60616<br>
				  Phone: (312) 567-3000
                    </ul>
                </li>
                </ul>
		<%	
		}%>
			           
			
			
			</div>
				
		
			<div id="mainContent" >
			
			<div style="padding-left:60px;padding-top:10px;">
			<h3>Contact Us:</h3>
			<h5>Illinois Institute of Technology, 3300 S Federal St, Chicago, IL 60616</h5>
			</div>
			
			<div style="padding-left:60px;">
				<p style="padding-left:24px; padding-top:0px; border:0px">
					<div id="googleMap" style="width:601px;height:301px;"></div>
				</p>
			</div>
	
		</div><br>
		</section>


		<section id="pageFooter">
			<div style="height:100px;">
		<table style="width:100%">
			<br>
			  <tr>
			    <td><a href="index.jsp">| Home |</a></td>
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
