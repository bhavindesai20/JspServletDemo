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
        <%@ page import="javax.servlet.ServletException"%>
        <%@ page import="javax.servlet.annotation.WebServlet"%>
        <%@ page import="javax.servlet.http.HttpServlet"%>
        <%@ page import="javax.servlet.http.HttpServletRequest"%>
        <%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.MongoException"%>
<%@ page import="com.mongodb.WriteConcern"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.ServerAddress"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %>

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
        <p class="titleWord">View/Cancel Your Orders Status</p>
        <p class="commonDescription">
           Here you can View and Cancel your Booking. If your checking date is after 5 days from today's date , you can not cancel your Booking.
           Please contact Management to cancel it.
        </p>
        <div class="formDiv">
            
         <%

            try{
            
            	MongoClient mongo = new MongoClient("localhost", 27017);
        		DB db = mongo.getDB("CSP595Project");
            
            DBCollection cOrder = db.getCollection("CustomerOrder");
            BasicDBObject query = new BasicDBObject();
            query.put("uname", uname);



            DBCursor pCursor = cOrder.find(query);
            if(pCursor.hasNext()){  
            %>
            <table>
                                <tr style="background-color:#09144A;color:white">
                                    <td >Rom Type</td>
                                    <td >CheckIn Date</td>
                                    <td >CheckOut Date</td>
                                    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount</td>
                                    <td >Cancel</td>
                                </tr>

            <%
                             
                            while (pCursor.hasNext()) {
                                    BasicDBObject databobj=(BasicDBObject)pCursor.next();

                                    String itemID=databobj.getString("itemID");
                                    String cindate = databobj.getString("c_in");
                                    String coutdate = databobj.getString("c_out");
                                    String price=databobj.getString("val");
                                    
                                    
                                    %>
                                
                                <tr>
                                    <td ><%=itemID%></td>
                                    <td ><%=cindate%></td>
                                    <td ><%=coutdate%></td>
                                    <td >&nbsp;&nbsp;&nbsp;&nbsp;<%=price%></td>
                                    <%

                                    String cancelPossibleString=null;
                                    Date today = Calendar.getInstance().getTime();
                                    SimpleDateFormat mdyFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    String myToday = mdyFormat.format(today);
                                    String cdate = databobj.getString("futureDate");
                                    int rnum=databobj.getInt("rnum");

                                    Date date1 = mdyFormat.parse(myToday);
                                    Date date2 = mdyFormat.parse(cdate);

                                    if(date1.compareTo(date2)>0){
                                            cancelPossibleString="<form><input style=\"background-color:#BCBCBC;\" type=\"submit\" value=\"No Cancel Allowed\" class=\"formbutton\" disabled=\"disabled\"/></form>";
                                        }
                                        else{
                                            cancelPossibleString="<form method=\"post\" action=\"DeletedUserSpecificBooking.jsp\">"+
                                                    "<input type=\"hidden\" name=\"rnum\" value=\""+rnum+"\" >"+
                                                    "<input type=\"submit\" value=\"Cancel Order\" class=\"formbutton\" />"+
                                                    "</form>";
                                        }

                                    %>
                                    <td ><%=cancelPossibleString%></td>
                                </tr>
                                <%
            }
            %>
            
            </table>
         <%   

        }

        else{
                %>
        <p class="commonDescription">
                        <strong>You don't have any Reservation at this Moment.</strong>
                </p>
        <%}

        } catch (MongoException e) {
        e.printStackTrace();
        }
        %>




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
