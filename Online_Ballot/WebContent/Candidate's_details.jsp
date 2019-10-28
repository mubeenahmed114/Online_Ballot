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
<title>Candidate's Details</title>
<style>
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
<body bgcolor="lightblue">
<div align="center">
<h1><b><font size="20"color="red">Candidate's Details</font></b></h1>
</div>
<div align="center">
	 <table>
<tr>
 <th>profile</th>
<th>
Aadhaar Id:-
</th>
<th>
Name:-
</th>
<th>
Mother name:-
</th>
<th>
Father name:-
</th>
<th>
Gender:-
</th>
<th>
Password
</th>
<th>
Electroll roll:-
</th>
<th>
Constituency:-
</th>
<th>
Candidate_ship:-
</th>
<th>
Party Name:-
</th>
<th>Symbol</th>
</tr>







<%

Connection con=null;
PreparedStatement ps=null;


	 
	
	try
	{
		
		
		
		con=DBCon.getConnection();
		 ps=con.prepareStatement("select * from  Candidate1");
		
			
    
	
	ResultSet rs=	ps.executeQuery();
	
  while(rs.next())
  {
	 %>

<tr>
 <td><img src="http://localhost:8081/Online_Ballot/DisplayImage?aadhar=<%=rs.getString("aadhaar")%>" width="100" height="100"></td>
<td>
<%=rs.getString(1)%>
</td>
<td>
<%=rs.getString(2)%>
</td>
<td>
<%=rs.getString(3)%>
</td>
<td>
<%=rs.getString(4)%>
</td>
<td>
<%=rs.getString(5)%>
</td>
<td>
<%=rs.getString(6)%>
</td>
<td>
<%=rs.getString(7)%>
</td>
<td>
<%=rs.getString(8)%>
</td>
<td>
<%=rs.getString(9)%>
</td>
<td>
<%=rs.getString(10)%>
</td>
<td><img src="http://localhost:8081/Online_Ballot/DisplaySymbolServlet?aadhar=<%=rs.getString("aadhaar")%>" width="100" height="100"></td>
</tr><% }%>
</table>
<% 
	 
	 

	

	   
  	
    
  	

		
	
  	}
	catch(Exception e)
	{
		e.printStackTrace();
	}



%>



</body>
</html>