<!DOCTYPE html>
<html lang="en">
<%   
			String name=(String)session.getAttribute("f_name");
			String uname = (String)session.getAttribute("uname");			
		%> 
<head>
    <meta charset="UTF-8">
    <title>The Grand Bhagwati</title>
	<script type="text/javascript" src="javascript.js"></script>
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body onload="init()">
    <div id="container">

        <section id="header">
          <div style="float:left;padding-top:10px;"><h1>&nbsp;&nbsp;&nbsp;The Grand Bhagwati</h1></div>
         
        </section> 
        <section>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a>
                </li>
				<li><a href="About.jsp">About US</a>
                </li>
				<li><a href="SignUp.jsp">Sign Up</a>
                </li>
                <li><a href="reservation.jsp">Make Reservation</a>
                </li>
                <li><a href="Contact.jsp">Contact Us</a>
                </li>
                <li><a href="Careers.jsp">Careers</a>
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
			<div id="sidebar" class="sidebarr">
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

                <ul>  
               <li>
                    <h4>Local Weather</h4>
                    <ul style="padding-left:60px;">
                      <span style="display: block !important; width: 180px; text-align: center; font-family: sans-serif; font-size: 12px;"><a href="http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:60290.1.99999&bannertypeclick=wu_bluestripes" title="Chicago, Illinois Weather Forecast" target="_blank"><img src="http://weathersticker.wunderground.com/weathersticker/cgi-bin/banner/ban/wxBanner?bannertype=wu_bluestripes&airportcode=KMDW&ForcedCity=Chicago&ForcedState=IL&zip=60290&language=EN" alt="Find more about Weather in Chicago, IL" width="160" /></a></span>
                    </ul>
                </li>
                </ul>
			
			</div>
				
		




			<div id="mainContent">
				<p class="titleWord">Welcome To The Grand Bhagvat.</p> 			
				
				
        <p class="titleWordSecond">One of ten prestigious hotels in the world to boast Five-Star Forbes Ratings for both its hotel and restaurant</p>

        <p class="commonDescription">
          Step into the The Grand Bhagvati, Chicago where great things happen easily. Whether you are  here for a meeting at North America largest convention center or to explore our city, our hotel is a vibrant destination where you can work, relax and enjoy a seamless lifestyle of both. Enjoy beautiful views of downtown, Lake Michigan and the Museum Campus from well-designed rooms and suites with 37inch HDTVs, a plush TGB Grand Bed and Plug Panel for powering up your digital world.
        </p>
        <p class="commonDescription">
          Connected to Downtown, our hotel offers a contemporary environment and innovative space for meeting, events, receptions and weddings. Refresh after a busy day in the indoor pool and Gym. Walk beyond our doors to discover exciting Chicago attractions, like Soldier Field, the Museum Campus, lakefront concerts at Northerly Island, and shopping on the Magnificent Mile. Modern decor, superb service and thoughtful lifestyle amenities enhance your leisure and business experience in the Windy City.
        </p><br>  <a href="images/brochure.pdf" target="_blank">
				<img src="images/pdf.gif" style="width: 17px; float: left; height: 17px;padding-left:30px">Download Our Brochure</a>
			</div>

      <div style="clear:both;"></div>

		</section>


		<section id="pageFooter">
			<div style="height:100px;">
		<table style="width:100%">
			<br>
			  <tr>
			    <!--td><a href="index.jsp">| Home |</a></td-->
			    <td><a href="About.jsp">| About Us |</a></td>
			    <td><a href ="SignUp.jsp">| Sign Up |</a></td>
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
