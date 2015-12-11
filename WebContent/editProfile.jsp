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
<%@ page import="java.io.*" %>
<%@ page import="com.mongodb.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*"%>
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
				 </li>
                 <li><a href="SignOut">SignOut</a>
                </li>
				 


            </ul>
        </nav></section>


	
		
		<section id="pageContent">
<div style="padding-left:50px">
<form action="InfoChange.jsp">
				<table>
                        <h3 style="color:red;">Enter new Details you want to update:</h3>

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
					  <br><input
                        type="submit" value="Submit Change" class="button" /><br><br><br></form>

</div>
                  
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
