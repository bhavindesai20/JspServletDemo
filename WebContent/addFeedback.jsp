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
          <div style="float:left;padding-top:10px;color:white;text-shadow: 3px -2px #0A2BCE;"><h1>&nbsp;&nbsp;&nbsp;The Grand Bhagwati</h1></div>
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

        <section>
            <div style="height:50px; background-color:#09144A;"></div>
        </section>

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
        <p class="titleWord">Add Feedback</p>
        <p class="commonDescription">
            We value your suggetion and comments.
        </p>
        <div class="formDiv">
        <form method="post" action="AddReview">
                        <table>
                            <tr>
                                <td>Room Type :</td>
                                <td>
                                    <select name="roomType" >
                                        <option value="std" selected>Standard</option>
                                        <option value="del">Delux</option>
                                        <option value="lux">Luxury</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td>Price :</td>
                                <td>
                                    $
                                    <input type="number" name="price" class="s" required/>
                                </td>
                            </tr>


                            <tr>
                                <td>Start Date :</td>
                                <td>
                                   <input name="cin" value="" type="date"required/>
                                </td>
                            </tr>

                            <tr>
                                <td>End Date :</td>
                                <td>
                                   <input name="cout" value="" type="date"required />
                                </td>
                            </tr>

                            <tr>
                                <td>Review Rating :</td>
                                <td>
                                   <input type="number" name="uRating" min="1" max="5" required />
                                </td>
                            </tr>
                            

                            <tr>
                                <td> Review Text :</td>
                                <td>
                                    <textarea name="reviewText" rows="4" cols="50"required> </textarea>
                                </td>
                            </tr>

                            <input type="hidden" name="userName" value="<%=uname%>" class="s" />

                            <tr>
                                <td>
                                    <input type="submit" class="formbutton" value="Add Review" />
                                </td>

                                <td>
                                </td>
                            </tr>

                        </table>

          </form>
        </div>
        <div style="clear:both;"></div>
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
