<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="dbconnection.*" %>
    <%@ page import="java.sql.*" %>
    <%@page import="java.util.Date"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Election Details</title>
</head>
<body>

<%

String elect=request.getParameter("elect");
String start=request.getParameter("date1");
String last=request.getParameter("date2");


Connection con=null;
PreparedStatement ps=null;

try{
	con=DBCon.getConnection();
	ps=con.prepareStatement("insert into Election values(?,?,?)");
	 ps.setString(1, elect);
	 ps.setString(2, start);
	 ps.setString(3, last);
	 
	 int res=ps.executeUpdate();
	 
	 if(res>0){
		 
		 System.out.println("inserted successfully");
	 }
	 else{
		 System.out.println("ooops.....Something went wrong");
	 }
	
	
	
	
	
}catch(Exception e){
	e.printStackTrace();
}

%>
<form action="">
<div align="center">
<%=new Date() %>



<h1>Election Details</h1>

ELECTION_TYPE
<select name="elect">
<option>-select-</option>
<option value="M.L.A">M.L.A</option>
</select></td></tr>
<br>
Start_DATE
<input type="text"name="date1"placeholder="DD/MM/YYYY">
<br>
<br>
last_DATE
<input type="text"name="date2"placeholder="DD/MM/YYYY">
<br>
<br>
<input type="submit"name="submit" value="submit">



</div>


</form>

</body>
</html>