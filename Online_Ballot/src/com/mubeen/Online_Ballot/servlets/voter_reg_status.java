package com.mubeen.Online_Ballot.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DBCon;

/**
 * Servlet implementation class voter_reg_status
 */
public class voter_reg_status extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String status=(String)session.getAttribute("status");
		System.out.println(id);
		System.out.println(status);
		
		status="active";
		

Connection con=null;
PreparedStatement ps=null;


	 
	
	try
	{
		
		
		
		con=DBCon.getConnection();
		 ps=con.prepareStatement("update voting set status=? where id=?");
		 
		    ps.setString(1, status);
			ps.setString(2, id);
         int res1= ps.executeUpdate();
         
         if(res1>0) {
        	 
        	 response.sendRedirect("Voter's_details.jsp"); 
         }
         
		 
		
			
    
	
	
	
		
	}
	catch(Exception e)
	{
	e.printStackTrace();	
	}	}

}
