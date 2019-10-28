<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
<script type="text/javascript">
	function login1() {
		var uname = document.Login.username.value;
		var pass = document.Login.password.value;

		if (uname = null || uname == "") {
			alert("Username can't be empty");
			return false;
		} else if (pass == null || pass == "") {
			alert("Password can't be empty");
			return false;
		}

	}
</script>

</head>
<body background="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\vote220.jpg"height="1000"width="1500">
	<form name="Login" action="" method="post"onsubmit="return login1()">

		<%
			String username, password;

			username = request.getParameter("username");
			password = request.getParameter("password");

			Connection con = null;
			PreparedStatement ps = null;

			try {

				Class.forName("oracle.jdbc.driver.OracleDriver");

				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "mubeen", "chikara");

				ps = con.prepareStatement("select * from Admin where email=? AND password=?");

				ps.setString(1, username);
				ps.setString(2, password);

				ResultSet rs = ps.executeQuery();

				if (rs.next()) {

					System.out.println("welcome: " + rs.getString(2));

					
					
					response.sendRedirect("Admin_home.jsp"); 		
 			      } 
				else {
					System.out.println("Entered Details are Incorrect");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>



		<div align="center">
			<img alt="admin_login"
				src="D:\Mini_Project_Practice_1\Online_Ballot\WebContent\images\login.gif"
				height="100" width="720">
		</div>
		<b><hr></b>
		<div align="center">

			<legend>
				<b><font size="8">Admin Login</font></b>
			</legend>
			<br> <input type="text" name="username"
				placeholder="Enter Username"> <br> <br> <input
				type="password" name="password" placeholder="Enter Password">
			<br> <br> <span><input type="submit" name="submit"value="Login"target="_parent"></span>
			 <span><input type="reset" name="reset"value="Cancel"></span>
		</div>





	</form>


</body>
</html>