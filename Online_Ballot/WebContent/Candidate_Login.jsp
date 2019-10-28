<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate_login</title>
<script type="text/javascript">
function login1(){
	var uname=document.Login2.username.value;
	var pass=document.Login2.password.value;
	
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
<style>
* {
    box-sizing: border-box;
}

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


footer {
    background-color: #777;
    padding: 10px;
    text-align: center;
    color: white;
}

@media (max-width: 600px) {
    nav, article {
        width: 100%;
        height: auto;
    }
}
</style>
</head>
<body bgcolor="#99ff99">
<%

String username,password;



username=request.getParameter("username");
password=request.getParameter("password");




Connection con=null;
PreparedStatement ps=null;


	 
	
	try
	{
		
		
		//register the driver
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//connection object
		
		 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mubeen","chikara");
		
		
		 

		
		 ps=con.prepareStatement("select*from  Candidate1 where aadhaar=? AND password=?");
		
		
		 
		
		ps.setString(1, username);
		ps.setString(2, password);

		
		

        
		
	ResultSet rs=	ps.executeQuery();
	
	
	if(rs.next()){

	   
    	System.out.println("welcome: "+rs.getString(2));
    	System.out.println("Aadhaar id: "+rs.getString(1));
    	System.out.println("Name: "+rs.getString(2));
    	System.out.println("Father name: "+rs.getString(3));
    	System.out.println("Mother name: "+rs.getString(4));
    	System.out.println("Gender: "+rs.getString(5));
    	System.out.println("Password: "+rs.getString(6));
    	System.out.println("Electroll roll: "+rs.getString(7));
    	System.out.println("Constituency: "+rs.getString(8));
    	System.out.println("Candidate_ship: "+rs.getString(9));
    	System.out.println("Party: "+rs.getString(10));
    	
    	session=request.getSession();
    	session.setAttribute("aadhaar", rs.getString("aadhaar"));
    	session.setAttribute("password", rs.getString("password"));
    	
    	
    	response.sendRedirect("Candidate_Home.jsp");
	}
    	else{
    		out.println("Entered Details are Incorrect");
    		
    	}
    	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

%>
<form action=""name="Login2"method="post""return login1()">
<header>
<div align="center">
<span><img alt="candidate_login" src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\t.png"height="150"></span>
<span><img alt="candidate_login" src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\topic2.png"height="150"></span>
</div>
</header>
<b><hr></b>
<div>
<marquee direction="left"><font size="6"color="yellow">  
<span>VOTE FOR TOMMOROW......... </span>
<span>TIME FOR CHANGE.........</span>
<span>THE CHOICE FOR CHANGE.......</span>
<span>A NEW VOICE........</span>
<span>A NEW VISION..........</span>
<span>NEW LEADERSHIP.........</span>
<span>NEW LEADERSHIP FOR A BRIGHTER FUTURE..........</span>
</font></marquee>
</div>
<b><hr></b>


<div align="center">
<br>
<input type="text"name="username"placeholder="Enter Username">
<br>
<br>
<input type="password"name="password"placeholder="Enter Password">
<br>
<br>
<span><input type="submit"name="submit"value="Login"target="_parent"></span>
<span><input type="reset"name="reset"value="Cancel"></span>
<br><br>
<a href="forget_password_Candi.jsp"target="_blank">Forget Password</a>
</div>


 <%
	
	String message = request.getParameter("voting_message");
 
 
 if(message != null){
	 
	 %>
	 
	  
    <b><h3 style="color:red;text-align:center"><%=message %></h3></b>
 <% 
 }

 %>


<br>


</form>



</body>
</html>