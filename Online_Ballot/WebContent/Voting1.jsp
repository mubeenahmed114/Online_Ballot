<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="dbconnection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voting</title>
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
<form action=""method="post">



	  <table>
  <tr>
   



    <th>profile</th>
    <th>Candidate_name</th>
    <th>Electroll</th>
    <th>Party/Independent</th>
    <th>Party_name</th>
    <th>Symbol</th>
    <th>Constituency</th>
    <th>View Details</th>
    
  </tr>
  <%  

String cons=request.getParameter("cons");
System.out.println(cons);
Connection conn = DBCon.getConnection();
PreparedStatement ps=conn.prepareStatement("select * from Candidate1 where constituency=?");
ps.setString(1, cons);
ResultSet  rs2=ps.executeQuery();
 
while(rs2.next())
{
 	%>   
  
  <tr>
  
    <td><img src="http://localhost:8081/Ems/DisplayImage?aadhar=<%=rs2.getString("aadhaar")%>" width="100" height="100"></td>
    <td>
    <%=rs2.getString(2)%>
    </td>
    <td>
    <%=rs2.getString(7)%>
    </td>
    <td>
    <%=rs2.getString(9)%></td>
    <td>
    <%=rs2.getString(10)%></td>
     <td><img src="http://localhost:8081/Ems/DisplaySymbolServlet?aadhar=<%=rs2.getString("aadhaar")%>" width="100" height="100"></td>
    <td>
    <%=rs2.getString(8)%></td>
    <td><a href="ViewCand_voter.jsp?aadhaar=<%=rs2.getString("aadhaar")%>"><input type="button"value="view"></a></td>
  </tr>
    <%} %>
 </table>
</form>
</body>
</html>
	   