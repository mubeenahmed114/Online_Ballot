<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbconnection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter's HomePage</title>
<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
	background-color: #666;
	padding: 30px;
	text-align: center;
	font-size: 35px;
	color: white;
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
	color: black;
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
	background-color: Dodgerblue;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
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

.dropdown2 {
	float: left;
	overflow: hidden;
}

.dropdown2 .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: black;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

.navbar a:hover, .dropdown2:hover .dropbtn {
	background-color: yellow;
}

.dropdown2-content {
	display: none;
	position: absolute;
	background-color: Dodgerblue;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown2-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown2-content a:hover {
	background-color: yellow;
}

.dropdown2:hover .dropdown2-content {
	display: block;
}
</style>

</head>
<body>


	<form action="Voting1.jsp" method="post" target="_parent">


		<%
			
		%>
		<header>
		<h1>
			<b><font size="40" color="blue">VOTING PAGE</font></b>
		</h1>

		</header>

		<hr>

		<div class="navbar"></div>


		<%
			Connection conn = DBCon.getConnection();
			
  
			String adhar = (String) request.getSession().getAttribute("adhar");
			System.out.println(adhar);
			PreparedStatement ps = conn.prepareStatement("select id,constituency from voting where id=?");
			ps.setString(1, adhar);
			ResultSet rs = ps.executeQuery();
			rs.next();
			%>
			<hr>
		<div align="center">

			<legend>
				<font size="25"><font color="brown">VOTE</font></font>
			</legend>

			Aadhaar id:- <input type="text" name="id" placeholder="Enter ID"
				value="<%=rs.getString(1)%>" readonly="readonly"> <br>
			<br> Constituency:- <input type="text" name="cons"
				placeholder="Enter Constituency" value="<%=rs.getString(2)%>"
				readonly="readonly"> <br> <br> <input
				type="submit" value="Go To Vote">
			
		 <%
	
	String message = request.getParameter("voting_message");
 
 
 if(message != null){
	 
	 %>
	 
	  
    <b><h3 style="color:red;text-align:center"><%=message %></h3></b>
 <% 
 }

 %>
		</div>




	</form>
</body>
</html>