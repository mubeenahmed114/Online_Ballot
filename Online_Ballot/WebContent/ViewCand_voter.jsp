<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dbconnection.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate</title>
</head>
<body>
<form action="VotingServlet" method="post">
<div align="center">
<div style="border:1px solid red;height:600px;width:400px;border-radius: 20px">

<%

String aadhaar= request.getParameter("aadhaar");
System.out.println("candidate adhar "+aadhaar);
Connection con=DBCon.getConnection();
PreparedStatement ps=con.prepareStatement("select * from  Candidate1 where aadhaar=?");

	
ps.setString(1, aadhaar);


ResultSet rs=	ps.executeQuery();

rs.next();

%>



<br>
<span><img alt="Cand" src="http://localhost:8081/Ems/DisplayImage?aadhar=<%=rs.getString("aadhaar")%>" height="100px"width="100px"></span>
<span><img alt="Cand" src="http://localhost:8081/Ems/SymbolDisplayServlet?aadhar=<%=rs.getString("aadhaar")%>" height="100px"width="100px"></span>
<br>
<br>

<div align="center">
 <table border="2"style="font-size: 25px">
 <tr>
<td>
Aadhaar Id:-
</td>
<td>
<%=rs.getString("aadhaar")%>
<input type="hidden" value="<%=rs.getString("aadhaar")%>" name="aadhaar">
</td>
</tr>
<tr>
<td>
Name:-
</td>
<td>
<%=rs.getString("Candidate_name")%>
</td>
</tr>
<tr>
<td>
Father name:-
</td>
<td>
<%=rs.getString("father")%>
</td>
</tr>
<tr>
<td>
Mother name:-
</td>
<td>
<%=rs.getString("mother")%>
</td>
</tr>
<tr>
<td>
Gender:-
</td>
<td>
<%=rs.getString("gender")%>
</td>
</tr>
<tr>
<td>
Electrol roll:-
</td>
<td>
<%=rs.getString("electroll")%>
</td>
</tr>
<tr>
<td>
Constituency:-
</td>
<td>
<%=rs.getString("constituency")%>
</td>
</tr>
<tr>
<td>
Candidate_ship:-
</td>
<td>
<%=rs.getString("candidateship")%>
</td>
</tr>
<tr>
<td>
Party Name:-
</td>
<td>
<%=rs.getString("party")%>
</td>
</tr>
</table>
<br>
<div align="center">
<input type="submit" value="Vote Now">
</div>


</div>


<%
rs.close();
ps.close();

String message = request.getParameter("voting_message");
System.out.println("voting message "+message);
%>



</div>

</div>


</form>
</body>
</html>