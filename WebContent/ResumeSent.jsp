<!DOCTYPE html>
<html lang="en">
<% 
if(session.getAttribute("f_name") == null){
    					response.sendRedirect("index.jsp");
			}
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
        
            <div style="float:right;padding-top:20px;padding-right:30px;"> </h2></div>
		
        </section> 
       

        

			<div style="background-color:#BBC4E1;height:300px;padding-top:10px;padding-left:20px;padding-right:20px;">
				<h1 style="color:white; "> Thank you so much for submitting resume. Your application is now under review!</h1>
				<img src="images/thanks.png" style="padding-left:380px" width="300px" height="150px"/>
				<br>
			 <%   
			if(session.getAttribute("uname") == "Admin"){
	  	%> 
				<span style="padding-left:150px" class="bookLink"><a href="AdminHome.jsp">Home</a><span>
			<%}else{%>
				
				<span style="padding-left:150px" class="bookLink"><a href="Welcome.jsp">Home</a><span>
				
			<%}%>
			<br><br>
			 </div>

      <div style="clear:both;"></div>

		</section>


		<section id="pageFooter">
			<div style="height:100px;">
			 </div>
		    		<div style="height:100px;text-align:center">
		&#169;&nbsp; All Rights Reserved by THe Grand Bhagwati<br><br>
		Guided by<b> Atef Bader</b>
		    </div>
		</section>	
		   
</body>

</html>
