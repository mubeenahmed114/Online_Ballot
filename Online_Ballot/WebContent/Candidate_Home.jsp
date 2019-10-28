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
<title>Candidate Home</title>
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
<body>
<%


Connection con=null;
PreparedStatement ps=null;



session=request.getSession();
String aadhaar =(String)session.getAttribute("aadhaar");
String password =(String)session.getAttribute("password");

try{
	
	con=DBCon.getConnection();
	 ps=con.prepareStatement("select * from  Candidate1 where aadhaar=? AND password=?");
	
		
ps.setString(1, aadhaar);
ps.setString(2, password);

ResultSet rs=	ps.executeQuery();

while(rs.next())
{
 %>
 <div align="center">
<h1><b><font size="90"color="red"><u>Candidate HomePage</u></font></b></h1>
</div>
 
 
 
 <div align="center">
 <table border="2"bordercolor="black">
 <tr>
<th>
Aadhaar Id:-
</th>
<th>
Name:-
</th>
<th>
Father name:-
</th>
<th>
Mother name:-
</th>
<th>
Gender:-
</th>
<th>
Electrol roll:-
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
<tr>
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
</tr>
</table>
<br>
<a href="Candidate_logout.jsp" ><input type="button" value="logout"></a>
</div>
 <%
	
	
}
}
catch(Exception e){
	
	e.printStackTrace();
	
}

%>


</body>
</html>