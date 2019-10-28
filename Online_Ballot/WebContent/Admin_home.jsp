<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<style type="text/css">
body {
    font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
    background-color: #666;
    padding: 30px;
    text-align: center;
    font-size: 30px;
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
  color: white;
  padding: 14px 16px;
  background-color: black ;
  font-family: inherit; 
  margin: 0; 
}

.navbar a:hover, .dropdown1:hover .dropbtn {
  background-color: orange;
}

.dropdown1-content {
  display: none;
  position: absolute;
  background-color: Dodgerblue;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
.dropdown2{
  float: left;
  overflow: hidden;
}

.dropdown2 .dropbtn {
  font-size: 16px; 
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: black;
  font-family: inherit; 
  margin: 0; 
}

.navbar a:hover, .dropdown2:hover .dropbtn {
  background-color: orange;
}


.dropdown2-content {
  display: none;
  position: absolute;
  background-color: Dodgerblue;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
.dropdown3{
  float: left;
  overflow: hidden;
}

.dropdown3 .dropbtn {
  font-size: 16px; 
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: black;
  font-family: inherit; 
  margin: 0; 
}

.navbar a:hover, .dropdown3:hover .dropbtn {
  background-color: orange;
}


.dropdown3-content {
  display: none;
  position: absolute;
  background-color: Dodgerblue;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown3-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}


.dropdown3-content a:hover {
  background-color: orange;
}

.dropdown3:hover .dropdown3-content {
  display: block;
}

</style>

</head>
<body background="D:\mini_project_practice\Ems\WebContent\images\vote224.jpg"height="1000"width="1500">
<form action="">
<header>
<div align="right"color="white">
<%=new Date() %></div>
<div align="center">
<img alt="evoting" src="D:\mini_project_practice\Ems\WebContent\images\login10.gif"height="50"width="720">
</div>
<br>
</header>
<hr>


<div class="navbar">


  
 <div class="dropdown1">
    <button class="dropbtn">Candidate
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown1-content">
      <a href="Candidate_Reg.jsp"target="_parent">Candidate Registration</a>
      <a href="Candidate's_details.jsp"target="_parent">Candidates Details</a>
    </div>
  </div> 
  <div class="dropdown2">
    <button class="dropbtn">Voter
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown2-content">
      <a href="Voter's_details.jsp"target="_parent">Voter's Details</a>
    </div>
 
  </div> 
 <div class="dropdown3">
    <button class="dropbtn">Result
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown3-content">
      <a href="Result.jsp"target="_parent">Voting Result</a>
    </div>
 
  </div> 
  <div align="right" style="float:right">
  <a href="Voter_logout.jsp"><input type="button" name=""value="Logout"></a>
  </div>
  </div>
  
<hr>





</form>

</body>
</html>