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
                    <h4>Login</h4>
                    <ul>
                    <form  method="post" action="SignIn">
                     &nbsp;&nbsp;&nbsp;Username: <input type="text" name="cname" placeholder=" Your username.." required/><br>
                     &nbsp;&nbsp;&nbsp;Password: &nbsp;<input type="password" name="cpassword" placeholder=" Your password.." required/><br>
                     &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"/>
                     </form>
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
			<div id="mainContent" >
				<p class="titleWord">Careers:</p>
		
	<h2>	<p style="padding-left:30px;" color="blue"><u>1.Room Attendant:</u></h2>&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;<strong>location:Chicago,IL &nbsp;&nbsp;Available positions:10</strong></p>
	 <p style="padding-left:30px;padding-right:50px" color="blue">Description:
	Room Attendants/Housekeeping Hosts contribute to the hotel's commitment to high quality guest service and teamwork and must be the kind of person who appreciates high standards of excellence.</p>
			<h4><p style="padding-left:30px;">Submit your resume here:</p></h4>
			<form action="ResumeSent.jsp">
			<input style="padding-left:30px;" type="file"/><br><br>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  type="Submit" value="submit"/><br>
			<p style="padding-left:30px;color:red;">Note: In order to submit resume you must be logged in!</p><br>
			</form>
			</div>
		  <div style="clear:both;"></div>

		</section>


		<section id="pageFooter">
			<div style="height:100px;">
		<table style="width:100%">
			<br>
			  <tr>
			    <td><a href="index.jsp">| Home |</a></td>
			    <td><a href="About.jsp">| About Us |</a></td>
			    <td><a href="Career.jsp">| Careers |</a></td>
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
