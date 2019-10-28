package com.mubeen.Online_Ballot.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DBCon;

public class VotingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession ses = request.getSession();
		String voter_aadhar = (String) ses.getAttribute("adhar");
		System.out.println(voter_aadhar);

		Connection con = DBCon.getConnection();
		PreparedStatement ps;
		PreparedStatement ps2;
		try {
			ps = con.prepareStatement("select * from  voting where id=?");

			ps.setString(1, voter_aadhar);
			ResultSet rs = ps.executeQuery();

			rs.next();

			if (rs.getString("voting_status").equals("no")) {

				String addhar = request.getParameter("aadhaar");
				System.out.println("candi " + voter_aadhar);

				ps2 = con.prepareStatement("select * from Candidate1 where aadhaar=?");

				ps2.setString(1, addhar);
				ResultSet rs3 = ps2.executeQuery();

				rs3.next();

				int count = rs3.getInt("vote_count");
				System.out.println(count);

				count = count + 1;

				PreparedStatement ps3 = con.prepareStatement("update  Candidate1 set vote_count=? where aadhaar=?");
				
				ps3.setInt(1, count);
				ps3.setString(2, addhar);
                int result = ps3.executeUpdate();
                
                if(result > 0) {
                	
                	PreparedStatement ps4 = con.prepareStatement("update  voting set voting_status=? where id=?");
    				
    				ps4.setString(1, "yes");
    				ps4.setString(2, voter_aadhar);
                    int result1 = ps4.executeUpdate();
                    
                    if(result1 > 0)
                    {
                    	System.out.println("Your voting is done successfully...");
                    	response.sendRedirect("Voter_details.jsp?voting_message=Your voting is done successfully...");
                    }
                	
                }
				
			} else {
				
				System.out.println("Voting is already done");
				response.sendRedirect("Voter_details.jsp?voting_message=Voting is already done");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

