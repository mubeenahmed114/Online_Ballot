<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
<%@page import="java.awt.Window"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="dbconnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter's Login</title>
<script type="text/javascript">
function login(){
	var uname=document.Login1.username.value;
	var pass=document.Login1.password.value;
	
	if(uname=null||uname==""){
		alert("Username can't be empty");
		return false;
	}
	else if(pass==null||pass==""){
		alert("Password can't be empty");
		return false;
	}
	
	
}
</script>
</head>
<body background="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\voter4.jpg"height="1300"width="1300">
<form name="Login1"action=""method="post"onsubmit="return login()">
<%
String username,password;
username=request.getParameter("username");
password=request.getParameter("password");
Connection con=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;
try
	{
		 con = DBCon.getConnection();
		 ps=con.prepareStatement("select * from  voting where email=? AND password=?");
		 ps.setString(1, username);
		 ps.setString(2, password);
		ResultSet rs=	ps.executeQuery();
		 rs.next();
	 	 session=request.getSession();
	  	session.setAttribute("email", rs.getString("email"));
		session.setAttribute("password", rs.getString("password"));
		session.setAttribute("adhar", rs.getString("id"));
	if(rs.getString("status").equals("active"))
	{
		String uname=request.getParameter("username");
		String pass=request.getParameter("password");	
		 ps1=con.prepareStatement("select * from  voting where email=? AND password=?");
		 	ps1.setString(1, uname);
			 ps1.setString(2, pass);
			
			 
			
		ResultSet rs3=	ps1.executeQuery();
		
			 
		
		 rs3.next();
			 

			  
   	System.out.println("welcome: "+rs3.getString(2));
   	
   	
   	
   	
   	response.sendRedirect("Voter_details.jsp");
     
  
   	}
	else{
	      System.out.println("Your Voter Registration Is Pending");
		response.sendRedirect("Voter_login.jsp?voting_message=Your details are incorrect");
	}
	rs.close();
	ps.close();
	con.close();
    	}
	
	catch(Exception e)
	{
		e.printStackTrace();
	}





%>

<div align="center">
<img alt="voter_login" src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\voter6.png"height="100"width="720">
</div>
<b><hr></b>



<div align="center">
<legend><b><font size="8">Voter Login</font></b></legend>
</div>
<br>
<div align="center">
<input type="text"name="username"placeholder="Enter Username">
<br>
<br>
<input type="password"name="password"placeholder="Enter Password">
<br>
<br>
</div>
<div align="center">
<input type="submit"name="submit"value="Login"target="_parent">
<br>
<br>
<a href="forget_password_voter.jsp"target="_parent">Forget Password</a>
</div>


 <%
	
	String message = request.getParameter("voting_message");
 
 
 if(message != null){
	 
	 %>
	 
	  
    <b><h3 style="color:red;text-align:center"><%=message %></h3></b>
 <% 
 }

 %>


<div>
<marquee direction="left"> 
 <img alt="voting" src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\vote3.jpg" height="180"width="720"></marquee>
</div>


 





</form>

</body>
</html>