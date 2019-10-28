<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="dbconnection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
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
      <h1><b><font size="30">Constituency Detail's</font></b></h1>
	  <table>
  <tr>
    
    
    <th>Constituency</th>
    <th>View Details</th>
    
  </tr>




<%

Connection conn = DBCon.getConnection();
PreparedStatement ps=conn.prepareStatement("select DISTINCT constituency from Candidate1");

ResultSet  rs1=ps.executeQuery();
 
while(rs1.next())
{
%>
 <tr>
  
    <td>
    <%=rs1.getString("constituency")%></td>
    <td><a href="Result_announce.jsp?cons=<%=rs1.getString("constituency") %>"><button>Result</button></a></td>
  </tr>




<%

}
%>
</table></div>
<%
%>


</div>
</body>
</html>