<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.lang.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="dbconnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter_registration</title>
<style>



</style>
<script type="text/javascript">
function register() {
	
	var id=document.registrationform.id.value;
	var name=document.registrationform.name.value;
	var email=document.registrationform.email.value;
	var p=document.registrationform.pass1.value;
	var c=document.registrationform.pass2.value;
	var state=document.registrationform.state.value;
	var dist=document.registrationform.dist.value;
	var cons=document.registrationform.cons.value;
	var attherateposition=email.indexOf("@");  
	var dotposition=email.lastIndexOf(".");
	
	
	
	
	   if(id==null ||id==""){  
		  alert("id can't be empty");  
		  return false;  
		} 
	   else if(c==null||c==""){
		   alert("password can't be empty");
		   return false;
	   }
	   else if(p.length<6){
		   alert("password length should be atleast 6");
		   return false;
	   }
	    
	    else if(p!=c){
	    	alert("password must be same");
	    	return false;
	    }
	    else if(name==null ||name==""){  
			  alert("ename can't be empty");  
			  return false; 
	    }
	    else if(state==null||state==""){
	    	alert("State field can't be empty");
	    	return false;
	    }
	   else if(dist==null||dist==""){
	    	alert("District field can't be empty");
	    	return false;
	    }
	     else  if(cons==null||cons==""){
	    	alert("Constituency field can't be empty");
	    	return false;
	    }
	     else if (attherateposition<1 || dotposition<attherateposition+2 || dotposition+2>=email.length){  
		     alert("Please enter a valid e-mail address \n @:"+attherateposition+"\n .:"+dotposition);  
		     return false;  
		     }   
}


</script>


</head>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("phone");
String password=request.getParameter("pass1");
String state=request.getParameter("state");
String dist=request.getParameter("dist");
String cons=request.getParameter("cons");
String v_status=request.getParameter("voting_status");
String status=request.getParameter("status");
String date=request.getParameter("date");

try
{
	
	Connection con = DBCon.getConnection();
	
	
	PreparedStatement ps=con.prepareStatement("insert into voting values(?,?,?,?,?,?,?,?,?,?,?)");
	
	
	ps.setString(1, id);
	
	ps.setString(2, name);

	ps.setString(3, email);
	ps.setString(4, password);
	ps.setString(5, state);
	ps.setString(6, dist);
	ps.setString(7,cons);
	ps.setString(8, v_status);
	ps.setString(9, status);
	ps.setString(10, date);
	ps.setString(11, mobile);
	
	
int res=	ps.executeUpdate();



	if(res>0)
	{
		System.out.println("Congrates Your Details Are Registered");
		response.sendRedirect("Voter_reg.jsp?voting_message=Congrates Your Details Are Registered......");
	}
	else
	{
		System.out.println("Sorry Your Details Are  Not Registered");
		response.sendRedirect("Voter_reg.jsp?voting_message=Sorry Your Details Are  Not Registered Please Contact Admin......");
	}
}
catch(Exception e)
{
	
	e.printStackTrace();
}

%>

<body background="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\voter3.jpg"width="1300">
<form name="registrationform"action="Voter_reg.jsp" method="post"  onsubmit="return register()">



<div align="center">
<img alt="vote" src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\vote11.png"height="100"width="720">
</div>
<b><hr></b>
<div>
<marquee direction="left"><font size="4"><font color="#1a66ff">
<span><B>BE SMART TO DO YOUR PART,VOTE.............</B></span>
</font></font></marquee>
</div>
<div class="v"align="center">

<legend><b><font size="8">Voter Registration</font></b></legend>
<table border="4"><font color="blue">
<tr>

<td><font color="black">
ID</font></td>
<td><input type="text"name="id"placeholder="Enter ID">
</td></tr>
<tr>
<td><font color="black">
Name</font></td>
<td><input type="text" name="name"placeholder="Enter Name">
</td>
</tr>
<tr>
<td><font color="black">
Email</font>
</td>
<td>
<input type="email" name="email"placeholder="Enter Email">
</td>
</tr>
<td><font color="black">
Mobile</font></td>
<td><input type="number"name="phone"placeholder="Enter ,mobile">
</td></tr>
<tr>
<tr>
<td><font color="black">
Password</font>
</td>
<td>
<input type="password"name="pass1"placeholder="Enter password">
</td>
</tr>
<tr>
<td><font color="black">
Confirm Password</font>
</td>
<td>
<input type="password"name="pass2"placeholder="Confirm password">
</td>
</tr>
<tr>
<td><font color="black">
State</font>
</td>
<td>
<input text="text"name="state"placeholder="Telangana">
</td>
</tr>
<tr>
<td><font color="black">
District</font>
</td>
<td>
<input type="text"name="dist"placeholder="Hyderabad">
</td>
</tr>
<tr>
<td ><font color="black">
Assembly/Parliamentary/Constituency</font>
</td>
<td>
<input type="text"name="cons"placeholder="Enter Constituency">
<input type="hidden"name="voting_status"value="no">
<input type="hidden"name="status"value="inactive">
<input type="hidden"name="date"value="">
</td>
</tr>


<tr>
<td colspan="2"align="center">
<input type="submit"name="submit"value="Register"></span>
<input type="reset"name="reset"value="Cancel"></span>
</td>
</tr></font></table>
</div>
</div>
 <%
	
	String message = request.getParameter("voting_message");
 
 if(message != null){
	 
	 %>
	 
	  
    <b><h3 style="color:red;text-align:center"><%=message %></h3></b>
 <% 
 }
 %>





</form>
</body>
</html>