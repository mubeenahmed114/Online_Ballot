<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HomePage</title>
</head>
<body>
<style type="text/css">
* {
    box-sizing: border-box;
}

body {
    font-family: Arial, Helvetica, sans-serif;
}


header {
    background-color: #A0A0A0;
    padding: 30px;
    text-align: center;
    font-size: 20px;
    color: white;
}
article {
    float: left;
    padding: 20px;
    width: 80%;
    background-color: #8080ff;
    height: 500px; 
}


section:after {
    
    display: table;
    clear: both;
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
.dropdown {
  float: left;
  overflow: hidden;
}


.dropdown .dropbtn {
  font-size: 16px; 
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: black;
  font-family: inherit; 
  margin: 0; 
}
.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: Dodgerblue;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  float: none;
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}


.dropdown-content a:hover {
  background-color: red;
}


.dropdown:hover .dropdown-content {
  display: block;
}
.dropdown1 {
  float: left;
  overflow: hidden;
}


.dropdown1 .dropbtn {
  font-size: 16px; 
  border: none;
  outline: none;
  color:white ;
  padding: 14px 16px;
  background-color: black;
  font-family: inherit; 
  margin: 0; 
}

.navbar a:hover, .dropdown1:hover .dropbtn {
  background-color: red;
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
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown1-content a:hover {
  background-color: red;
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
  background-color: red;
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
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}


.dropdown2-content a:hover {
  background-color: red;
}

.dropdown2:hover .dropdown2-content {
  display: block;
}





</style>

<script >


</script>
</head>
<body bgcolor="#1aa3ff">
<form action="">
<header>
<div align="right">
<%=new Date() %>
</div>
<div align="center">
<h1><b><font size="50"><font color="blue"><i>ONLINE-BALLOT</i></font></font></b></h1>
</div>
<br>
</header>
<hr>



<div class="navbar">

<div class="dropdown">
    <button class="dropbtn">Admin
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="Admin_Login.jsp"target="_parent">Admin Login</a>
    </div>
  </div> 
  
 <div class="dropdown1">
    <button class="dropbtn">Candidate
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown1-content">
      <a href="Candidate_Login.jsp"target="_parent">Candidate Login</a>
    </div>
  </div> 
  <div class="dropdown2">
    <button class="dropbtn">User/Voter
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown2-content">
      <a href="Voter_reg.jsp"target="_parent">Voter Registration</a>
      <a href="Voter_login.jsp"target="_parent">Voter Login</a>
    </div>
  </div> 
  </div>
  </div>
<hr>
<div ><b><marquee direction="left"><font color="red"><font size="6">
<span>VOTE,IT'S YOUR RIGHT AND RESPONSIBILITY......</span>
<span>BE SMART DO YOUR PART,CAST VOTE.......</span>
</font></font></marquee></B></div>
<hr>

<section>
<img src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\voter5.jpg"height="500"width="260">



<article>

<font color="black"><b>
Election in India: In Democratic India, general elections take place every five years. <br>
All those who are eighteen years of age have a right to vote. <br>
A number of candidates seek the election. <br>

 They move from door to door. They hold public meetings and explain the programs of their parties.<br>
 If they get majority of votes, they win; but if they do not, they lose. An election, therefore, is like a battle. 
 But this battle is fought in a peaceful way. <br>
 It is a battle of ballots, not a battle of bullets.<br>


 
But in one sense an election is a kind of examination. Good students prepare hard for their examinations.<br> 
Those who work hard get good marks. But those who never care for their books, fail. <br>
This is true of elections, too. There are good and honest leaders. They care for the welfare of the people.<br>
 They never forget their voters. So, they get elected without much difficulty.<br>

But there are also those who never care for these voters. Their only business is to earn as much as possible.<br>
 They take bribe and help black-marketers. They never say ‘no’ to their voters but they never fulfill any promise.<br>
They remember their promises and their voters only when another election knocks at the door. Such leaders are like playful boys.<br>
 Bad boys care for their examination only when it comes too near.<br> 
How nervous they feel, then! They labor day and night for a month. But still they fail.<br>

Importance of Voting: Voting is important because:-<br>

1.It empowers the common people to choose their rulers.<br>
2.Common people have an indirect control over the functioning of the government.<br>
3.There remains no room for oppressive government. General public have power to change government in the upcoming elections, if they are not satisfied with the performance of the government.<br>
4.People have the power to raise voice against social evils and come together as a society.<br>
5.In a democracy like India, everyone's vote is considered equal.<br>


</b>
</font>
</article>
</section>

<footer>
<video width="1350"height="300"  autoplay	>
<source src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\video\movie1.mp4" type="video/mp4"></source>
</video>

</footer>



</body>
</html>