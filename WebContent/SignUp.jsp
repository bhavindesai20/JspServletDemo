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
		
	<%   
			if(session.getAttribute("uname") == "Admin"){
	  	 	%>
		<section>
        <nav>
			<ul>
			 <li><a href="AdminHome.jsp"> Admin Home</a></li>
			
             <li><a href="AddRoomBooking.jsp">Make Reservation</a></li>
             </li><li><a href="SignOut">SignOut</a></li>
	
            </ul>
        </nav></section>
<%}else{%>
      <section>
        <nav><ul>
                <li><a href="index.jsp">Home</a>
                </li>
				<li><a href="About.jsp">About US</a>
                </li>
				<li><a href="reservation.jsp">Make Reservation</a>
                </li>
                <li><a href="Contact.jsp">Contact Us</a>
                </li>
                <li><a href="Careers.jsp">Careers</a>
                </li>
					<%   
			if(session.getAttribute("f_name") != null){
	  	%>  
                <li><a href="SignOut">SignOut</a>
                </li>
		<%}%>
            </ul>
        </nav></section>
		<%}%>
		
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
			<div align="center" id="mainContent" >
			
			<form method="post" action="SignUp">
                   

                    <table>
                      <br>
                        <h1 style="padding-left: 20px;">Create an account</h1>

                        <tr>
                            <td><b>First name:</b></td>
                            <td><input type="text" name="fname"
                                placeholder="  First name.." required />
                            </td>
                        </tr>

                        <tr>
                            <td><b>Last name:</b></td>
                            <td><input type="text" name="lname"
                                placeholder="  Last name.." required />
                            </td>
                        </tr>

                        <tr>
                            <td><b>User name:</b></td>
                            <td><input type="text" name="uname"
                                placeholder="  User name.." required />
                            </td>
                        </tr>

                        <tr>
                            <td><b>Email:</b></td>
                            <td><input type="text" name="email"
                                placeholder="  Email address.." required />
                            </td>
                        </tr>
                       

                        <tr>
                            <td><b>Password:</b></td>
                            <td><input type="password" name="password"
                                placeholder="  Secured password.." required />
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
                            <td><input type="date" name="birthday" required>
                            </td>
                        </tr>


                        <tr>
                            <td><b>Address:</b></td>
                            <td><input type="text" name="address"
                                placeholder="  Enter address.." required />
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




                    </table>
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                        type="submit" value="Create Account" />
					<br><br><br>


                </form>
				
			</div>
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
