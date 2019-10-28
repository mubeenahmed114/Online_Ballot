package com.mubeen.Online_Ballot.servlets;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dbconnection.DBCon;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DisplayImage
 */
public class DisplayImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		String id = request.getParameter("aadhar");
		System.out.println("adhar no "+id);
		Connection conn = DBCon.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("select profile from candidate1 where aadhaar=?");
			ps.setString(1,id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			byte[] image = rs.getBytes(1);
			System.out.println(image);
			
			/*byte[] imageData = image.getBytes(1, (int) image.length());*/
			response.setContentType("image/jpeg");
			   response.setHeader("Content-Type", "image/jpeg");
		        
		          response.setHeader("Content-Length", String.valueOf((int) image.length));
		        
		 
			OutputStream out = response.getOutputStream();
			
			out.write(image);
			out.close();
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
			
	}

}
