<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="dbconnection.*" %>
    <%@ page import="javax.swing.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Registration</title>
<style type="text/css">
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
    background-color:white;
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
    height: 650px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
    content: "";
    display: table;
    clear: both;
    height: 800px;
}

/* Style the footer */
footer {
    background-color: #777;
    padding: 10px;
    text-align: center;
    color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 800px) {
    nav, article {
        width: 100%;
        height: auto;
    }
}





</style>
<script type="text/javascript">
function register() {
	
	var id=document.registrationform.id.value;
	var name=document.registrationform.name.value;
	var fname=document.registrationform.fname.value;
	var mname=document.registrationform.mname.value;
	var Gender=document.registrationform.Gender.value;
	var p=document.registrationform.pass1.value;
	var c=document.registrationform.pass2.value;
	var Eroll=document.registrationform.Eroll.value;
	var cons=document.registrationform.cons.value;
	var cand=document.registrationform.cand.value;
	var pname=document.registrationform.pname.value;
	
	
	
	   if(id==null ||id==""){  
		  alert("id can't be empty");  
		  return false;  
		}
	   else if(name==null||name==""){
		   alert("name field can't be empty");
		   return false;
	   }
	   else if(fname==null||fname==""){
		   alert("Father name can't be empty");
		   return false;
	   }
	   else if(mname==null||mname==""){
		   alert("Mother name can't be empty");
		   return false;
	   }
	   else if(p==null||p==""){
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
	    else if(Eroll==null ||Eroll==""){  
			  alert("Electrol roll can't be empty");  
			  return false; 
	    }
	     else if(cons==null||cons==""){
	    	alert("Constituency field can't be empty");
	    	return false;
	    }
	     
	     else if(pname==null||pname==""){
			   alert("Party name can't be empty");
			   return false;
		   }
	     else if(cand==null||cand==""){
			   alert("Candidate can't be selected");
			   return false;
			   }
       
	     
}



</script>
</head>
<body bgcolor="#80ffff">
<form name="registrationform"  action="CandidateRegistration" method="post"onsubmit="return register()" enctype="multipart/form-data">

<header>
<div align="center">
<h1><b><font size="90"color="red"><u>Candidate Registration</u></font></b></h1>

</div>
</header>
<section>
<img src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\voter4.jpg"height="650"width="266">
<article>

<div class="C"align="center">
<h1><font size="60"color="orange">Candidate Registration Form</font></h1><br>
<table border="2"bordercolor="black">
<tr>
<td>
Aadhaar Id:-
</td>
<td>
<input type="text"name="id"placeholder="Enter ID">
</td>
</tr>
<tr>
<td>
Name:-
</td>
<td>
<input type="text"name="name"placeholder="Enter Name ">
</td>
</tr>
<tr>
<td>
Father name:-
</td>
<td>
<input type="text"name="fname"placeholder="Enter Father name">
</td>
</tr>
<tr>
<td>
Mother name:-
</td>
<td>
<input type="text"name="mname"placeholder="Enter Mother name">
</td>
</tr>
<tr>
<td>
Gender:-
</td>
<td>
<input type="radio"name="Gender"value="Male">Male
<input type="radio"name="Gender"value="Female">Female</td>
</tr>
<tr>
<td>
Password:-
</td>
<td>
<input type="password"name="pass1" placeholder="min 6 digit password">
</td>
</tr>
<tr>
<td>
Confirm Password:-
</td>
<td>
<input type="password"name="pass2"placeholder="confirm password">
</td>
</tr>
<tr>
<td>
Electrol roll:-
</td>
<td>

<select name="Eroll">
<option>-select-</option>
<option value="M.L.A">M.L.A</option>
<option value="M.P">M.P</option>
</select></td></tr>
<tr>
<td>
Constituency:-
</td>
<td>
<input type="text"name="cons"placeholder="Enter Constituency">
</td>
</tr>
<tr>
<td>
Candidate_ship:-
</td>
<td>
<select name="cand">
<option>-select-</option>
<option value="independent">Independent</option>
<option value="party">Party</option>
</select></td></tr>
<tr>
<td>
Party Name:-
</td>
<td>
<input type="text"name="pname"placeholder="Enter Party Name">
</td>
</tr>
<tr>
<td>
Profile pic:-
</td>
<td>
<input type="file" name="pic" size="50" accept="image/*">
</td>
</tr>
<tr>
<td>
Party Symbol:-
</td>
<td>
<input type="file" name="pic1" size="50" accept="image/*">
</td>
</tr>
<tr>
<td colspan="2"align="center">
<input type="submit"name="submit"value="Register">
<input type="reset"name="reset"value="cancel">
</td>
</tr>
</table>

 <%
	
	String message = request.getParameter("voting_message");
 
 
 if(message != null){
	 
	 %>
	 
	  
    <b><h3 style="color:red;text-align:center"><%=message %></h3></b>
 <% 
 }

 %>


</section>


</form>

</body>
</html>