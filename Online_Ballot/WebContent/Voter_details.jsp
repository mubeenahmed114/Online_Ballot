<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.lang.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="dbconnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter Details</title>
<style type="text/css">

body {
    font-family: Arial, Helvetica, sans-serif;
}


header {
    background-color: #666;
    padding: 30px;
    text-align: center;
    font-size: 35px;
    color: white;
}
article {
    float: left;
    padding: 20px;
    width: 80%;
    background-color: #f1f1f1;
    height: 500px; /* only for demonstration, should be removed */
}


section:after {
    content: "";
    display: table;
    clear: both;
}
 .navbar {
  overflow: hidden;
  background-color: black;
  font-family: Arial;
}


.navbar a {
  float: left;
  font-size: 16px;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
.dropdown1 {
  float: left;
  overflow: hidden;
}


.dropdown1 .dropbtn {
  font-size: 16px; 
  border: none;
  outline: none;
  color:black ;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit; 
  margin: 0; 
}

.navbar a:hover, .dropdown1:hover .dropbtn {
  background-color: yellow;
}

.dropdown1-content {
  display: none;
  position: absolute;
  background-color: lightred;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown1-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown1-content a:hover {
 background-color: yellow;
}

.dropdown1:hover .dropdown1-content {
  display: block;
}








</style>
</head>
<body>

<hr>
<div class="navbar">


  
 <div class="dropdown1">
    <button class="dropbtn">VOTE
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown1-content">
      <a href="Voting.jsp"target="_parent">Voting</a>
      
    </div>
  </div> 
  <div align="right" style= "float:right">
  <a href="Voter_logout.jsp"><input type="button" name=""value="Logout"></a>
  </div>
  </div>
  <br>
  
  
<hr>












<% 
 


     session=request.getSession();
     String email=(String)session.getAttribute("email");
     String password=(String)session.getAttribute("password");
 
 
 






try{
	
	
	
	Connection	con=DBCon.getConnection();
	PreparedStatement	 ps=con.prepareStatement("select * from  voting where email=? AND password=? ");
	
		
         ps.setString(1, email);
         ps.setString(2, password);

       ResultSet rs=	ps.executeQuery();

            if(rs.next())
                  {
                  %>
 <section>
  <div align="center">
<h1></h1><b><font size="20">Voter Details</font></b></h1>
</div>


 <div align="center">
 <table border="2">
<th>
Aadhaar Id:-
</th>
<tr>
<td>
<%=rs.getString(1)%>
</td>
</tr>
<tr>
<th>
Name:-
</th>
<tr>
<td>
<%=rs.getString(2)%>
</td>
</tr>
<tr>
<th>
Email:-
</th>
<tr>
<td>
<%=rs.getString(3)%>
</td>
</tr>
<th>

Password:-
</th>
<tr><td>
<%=rs.getString(4)%>
</td>
</tr>
<tr>
<th>
State:-
</th>
<tr>
<td>
<%=rs.getString(5)%>
</td>
</tr>


<th>
District:-
</th>
<tr>
<td>
<%=rs.getString(6)%>
</td>
</tr>

<th>
Constituency:-
</th>
<tr>
<td>
<%=rs.getString(7)%>
</td>
</tr>
<th>
</table>
<br>
</div>
</section>



 <%
	
	String message = request.getParameter("voting_message");
 
 if(message != null){
	 
	 %>
	 
	  
    <b><h3 style="color:red;text-align:center"><%=message %></h3></b>
 <% 
 }
 
}
}
catch(Exception e){
	
	e.printStackTrace();
	
}

%>


</body>
</html>