<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.mongodb.*" %>

<%
	
	
	    
		MongoClient mongo = new MongoClient("localhost", 27017);
		DB db = mongo.getDB("CSP595Project");
		//String uname1= "admin";
		String c_in = "2015-12-10";
		String c_out = "2015-12-15";
		DBCollection CustomerOrder = db.getCollection("CustomerOrder");
		
		for(int i=0;i<1;i++){
		
		String itemID = "Luxary_Hollywood";
			
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
		
		CustomerOrder.insert(doc);
				
		}
		
		for(int i=0;i<1;i++){
				
		String itemID = "Luxary_Cabana";
			
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
	
		CustomerOrder.insert(doc);
				
		}

		for(int i=0;i<1;i++){
				
		String itemID = "Luxary_Lanai";
	
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
		
		CustomerOrder.insert(doc);
				
		}
			
	
		for(int i=0;i<1;i++){
				
		String itemID = "Standard_Hollywood";
			
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
		
		CustomerOrder.insert(doc);
				
		}

		for(int i=0;i<1;i++){
				
		String itemID = "Standard_Cabana";
	
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
		
		CustomerOrder.insert(doc);
				
		}

		for(int i=0;i<1;i++){
				
		String itemID = "Standard_Lanai";
			
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
		
		CustomerOrder.insert(doc);
				
		}
			
			
		for(int i=0;i<1;i++){
				
		String itemID = "Deluxe_Hollywood";
			
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
		
		CustomerOrder.insert(doc);
				
		}
		
		for(int i=0;i<1;i++){
				
		String itemID = "Deluxe_Cabana";
			
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
		
		CustomerOrder.insert(doc);
				
		}

		for(int i=0;i<1;i++){
				
		String itemID = "Deluxe_Lanai";
			
		BasicDBObject doc = new BasicDBObject("title", "CustomerOrder").append("itemID", itemID).append("c_in", c_in).append("c_out", c_out);
		
		CustomerOrder.insert(doc);
				
		}

		
	
	response.sendRedirect("Thanks.jsp");%>
	
	