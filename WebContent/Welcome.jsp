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
    <script type="text/javascript" src="javascript.js"></script>
</head>

<body onload="init()">
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
				
                <li><a href="reservation.jsp">Make Reservation</a>
                </li>
                <li><a href="Contact.jsp">Contact Us</a>
                </li>
                <li><a href="Careers.jsp">Careers</a>
                </li>
				 </li>
                 <li><a href="myProfile.jsp">Edit Profile</a>
                </li>
				 </li>
                 <li><a href="SignOut">SignOut</a>
                </li>
				


            </ul>
        </nav></section>

		
	<form name="autofillform" action="autocomplete">
      <table border="0" cellpadding="5"> 
          <tr style="padding:0px;">
            <td style="width:150px;padding-left:10px"><strong>Search Rooms:</strong></td>
                        <td>
                            <input type="text" style="background-color:#F1F1F1;" size="30" id="complete-field" onkeyup="doCompletion()" placeholder="search rooms instantly..."/>
                        </td>
          </tr>
          <tr>
              <td id="auto-row" colspan="2">
                <table id="complete-table" class="popupBox" />
              </td>
          </tr>
     
      </table>
    </form>



        <section id="carouselForFront">
            <img src="images/4.jpg" alt="">
        </section>


<section id="pageContent">
			
				
			<div id="mainContentWel" >
					<p class="titleWord">Welcome to the Grand Bhagwati Hotel! 
						<span class="bookLink"><a href="ViewAndUpdateUserOrder.jsp">View Reservation Status</a><span>
					</p>

					<p class="commonDescription">
					<strong>One of ten prestigious hotels in the world to boast Five-Star Forbes Ratings for both its hotel and restaurant
Step into the The Grand Bhagvati, Chicago where great things happen easily. Whether you are here for a meeting at North America largest convention center or to explore our city, our hotel is a vibrant destination where you can work, relax and enjoy a seamless lifestyle of both. Enjoy beautiful views of downtown, Lake Michigan and the Museum Campus from well-designed rooms and suites with 37inch HDTVs, a plush TGB Grand Bed and Plug Panel for powering up your digital world.
<br><br>
Connected to Downtown, our hotel offers a contemporary environment and innovative space for meeting, events, receptions and weddings. Refresh after a busy day in the indoor pool and Gym. Walk beyond our doors to discover exciting Chicago attractions, like Soldier Field, the Museum Campus, lakefront concerts at Northerly Island, and shopping on the Magnificent Mile. Modern decor, superb service and thoughtful lifestyle amenities enhance your leisure and business experience in the Windy City.
						We have Three type of rooms for you. Standard, Deluxe, Luxury. All of them have three sub type based on it's location.
        			</strong></p>
					
				
<h4 style="padding-left:20px"><u>different styles in different types of Rooms</u>:</p></h4>
 <p class="commonDescription">
						Hollywood : It has two big bed but it shares common head board.
        			</p>

        			<p class="commonDescription">
						Cabana : It is a room which is besides to our Swimming pool.
        			</p>

        			<p class="commonDescription">
						Lanai : It is famouse for its scenic beauty.
        			</p>
					
 
        			
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
