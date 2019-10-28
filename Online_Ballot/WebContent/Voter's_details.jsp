<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.lang.*" %>
    <%@ page import="dbconnection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter Details</title>
<style type="text/css">
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
}

td, th {
    border: 2px solid #dddddd;
    text-align: right;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body bgcolor="orange">
<form action="voter_reg_status"method="get">
<div align="center">
<h1><b><font size="20"color="red">Voter's Details</font></b></h1>
</div>
<%

Connection con=null;
PreparedStatement ps2=null;


	 
	
	try
	{
		
		
		
		con=DBCon.getConnection();
		 ps2=con.prepareStatement("select * from  voting");
		
			
    
	
	ResultSet res=	ps2.executeQuery();
	
	%><div align="center">
	 <table>
	<tr> 
	 
<th>
Aadhaar Id:-
</th>
<th>
Name:-
</th>
<th>
Email:-
</th>
<th>
Password:-
</th>
<th>
State:-
</th>
<th>
District:-
</th>
<th>
Constituency:-
</th>
<th>Status</th>
</tr>
	
	
	
	<%
	
	
	
  while(res.next())
  {
	 %>
<tr>
<td>
<%=res.getString(1)%>
</td>
<td>
<%=res.getString(2)%>
</td>
<td>
<%=res.getString(3)%>
</td>
<td>
<%=res.getString(4)%>
</td>
<td>
<%=res.getString(5)%>
</td>
<td>
<%=res.getString(6)%>
</td>
<td>
<%=res.getString(7)%>
</td>
<% String status = res.getString(9);
 if(status.equals("inactive"))
 {
	 %>
	 
	<td><a href=""><button name="status" value="active">active</button></a></td>
	
<% 


 
 }else{%> 

<td><%=res.getString(9)%></td>
<%}
 %></tr>






<%   }%></table></div><% 
  
  	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</form>
</body>
</html>