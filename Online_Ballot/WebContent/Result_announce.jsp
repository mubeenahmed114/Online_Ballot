<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbconnection.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result Announce</title>
<style type="text/css">
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
 <div align="center">
      <h1><b><font size="30">Result Announce</font></b></h1>
	  <table>
  <tr>
    
    
    <th>Candidate_name</th>
    <th>Constituency</th>
    <th>Party</th>
    
    <th>Vote_count</th>
    
  </tr>
  
  
<%

String constituency=request.getParameter("cons");
System.out.println(constituency);

Connection conn = DBCon.getConnection();
PreparedStatement ps=conn.prepareStatement("select profile,candidate_name,constituency,party,vote_count from Candidate1 where constituency=? ");

ps.setString(1, constituency);

ResultSet  rs2=ps.executeQuery();
 
while(rs2.next())
{
%>
 <tr>
<td>
    <%=rs2.getString("candidate_name")%></td>
     <td>
    <%=rs2.getString("constituency")%></td>
    <td>
    <%=rs2.getString("party") %></td> 
    <td>
    <%=rs2.getString("vote_count")%></td>
   
  </tr>




<%
}
%>
</table></div>



</div>

<%rs2.close();
ps.close();%>




</body>
