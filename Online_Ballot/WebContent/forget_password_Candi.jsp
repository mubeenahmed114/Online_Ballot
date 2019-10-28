<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbconnection.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password Recovery</title>
<script type="text/javascript">
function recovery(){
	var email=document.recover.email.value;
	var pass1=document.recover.pass1.value;
	var pass2=document.recover.pass2.value;
	
	if(email=null||email==""){
		alert("Username can't be empty");
		return false;
	}
	else if(pass1==null||pass1==""){
		alert("Password can't be empty");
		return false;
	}
	else if(pass1!=pass2){
	    alert("confirm password should be same");
	    return false;
	}
	
}


</script>
</head>
<body bgcolor="yellow">
<form name="recover"action=""method="post"target="_parent"onsubmit="return recovery()">

<%
String email=request.getParameter("email");
String pass=request.getParameter("pass1");

Connection con=null;
PreparedStatement ps=null;
try{
	
	con=DBCon.getConnection();
	ps=con.prepareStatement("update voting set password=? where email=?");
	ps.setString(1, pass);
	ps.setString(2, email);
	
	
	int res2=ps.executeUpdate();
	if(res2>0)
	{
	



		response.sendRedirect("Candidate_Login.jsp?voting_message=Your Password is Changed Successfully");
		
		
	}
	
	ps.close();
	con.close();
}catch(Exception e){
	e.printStackTrace();
	
}

%>
	<h1 style="color:green;text-align:center">Password Recovery</h1>
<h4 style="text-align:center">
<input type="text"name="email"placeholder="Enter Your email">
<br><br>
<input type="password"name="pass1"placeholder="New Password">
<br>
<br>
<input type="password"name="pass2"placeholder="Confirm password">
<br>
<br>
<input type="submit"name="submit"value="Send"></a>
</h4>


</body>
</html>