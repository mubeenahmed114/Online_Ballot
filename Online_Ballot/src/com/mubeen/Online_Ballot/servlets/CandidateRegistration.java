package com.mubeen.Online_Ballot.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dbconnection.DBCon;

/**
 * Servlet implementation class CandidateRegistration
 */
@MultipartConfig(maxFileSize=16177215)
public class CandidateRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		String id=request.getParameter("id");
   		String name=request.getParameter("name");
   		String fname=request.getParameter("fname");
   		String mname=request.getParameter("mname");
   		String gender=request.getParameter("Gender");
   		String password=request.getParameter("pass1");
   		String eroll=request.getParameter("Eroll");
   		String cand=request.getParameter("cand");

   		String cons=request.getParameter("cons");
   		String pname=request.getParameter("pname");
   		InputStream inputStream = null; // input stream of the upload file
   		InputStream inputStream1 = null;
   		// obtains the upload file part in this multipart request
   	try {
   		
   		Part filePart = request.getPart("pic");
   		
   		
   		Part filePart1 = request.getPart("pic1");
   		System.out.println(filePart1);



   		if (filePart != null) {
   		    // prints out some information for debugging
   		    System.out.println(filePart.getName());
   		    System.out.println(filePart.getSize());
   		    System.out.println(filePart.getContentType());
   		     
   		    // obtains input stream of the upload file
   		    inputStream = filePart.getInputStream();
   		    System.out.println(inputStream);
   		}
   	
   		if (filePart1 != null) {
   		    // prints out some information for debugging
   		    System.out.println(filePart1.getName());
   		    System.out.println(filePart1.getSize());
   		    System.out.println(filePart1.getContentType());
   		     
   		    // obtains input stream of the upload file
   		    inputStream1 = filePart1.getInputStream();
   		    System.out.println(inputStream);
   		}
   		
   	}catch(Exception e) {
   		e.printStackTrace();
   	}
   		Connection con=null;

   		try
   		{
   			
   			con=DBCon.getConnection();
   				
   			
   			
   			
   			PreparedStatement ps=con.prepareStatement("insert into Candidate1 values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
   			
   			

   			
   			ps.setString(1, id);
   			
   			ps.setString(2, name);

   			ps.setString(3, fname);
   			ps.setString(4, mname);
   			ps.setString(5, gender);
   			ps.setString(6, password);
   			ps.setString(7, eroll);
   			ps.setString(8,cons);
   			ps.setString(9, cand);
   			ps.setString(10, pname);
   			if(inputStream !=null){
   			ps.setBlob(11, inputStream);
   			ps.setBlob(12, inputStream1);
   			ps.setInt(13, 0);
   			}

   			
   			
   		int res=	ps.executeUpdate();



   			if(res>0)
   			{
   		
   				response.sendRedirect("Candidate_Reg.jsp?voting_message=candidate details are saved successfully");
   				
   				
   			}
   			else
   			{
   				response.sendRedirect("Candidate_Reg.jsp?Voting_message=Sorry Your Details Are  Not Registered");
   			}
   		}
   		catch(Exception e)
   		{
   			
   			e.printStackTrace();
   		}



   	
   	
   	}

}
