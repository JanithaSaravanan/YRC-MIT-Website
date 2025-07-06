package mityrc.user.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AddScribe")
public class AddScribe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String candidateName = request.getParameter("candidateName");
        int candidateAge = Integer.parseInt(request.getParameter("candidateAge"));
        String candidateGender = request.getParameter("candidateGender");
        String examName = request.getParameter("examName");
        String examStart = request.getParameter("examStart");
        String examEnd = request.getParameter("examEnd");
        String examLocation = request.getParameter("examLocation");
        String scribePreferences = request.getParameter("scribePreferences");
        String additionalInfo = request.getParameter("additionalInfo");
		Connection con = null;
		// Establishing the database connection and executing the query
		try {
			// Step 1: Initialize the database connection
			con = DatabaseCon.initialiseDB();

			// Disable auto-commit for transaction management
			con.setAutoCommit(false);

			// Step 2: SQL query to insert data into the 'blood' table
			String ins1 = "INSERT INTO scribe_requests (candidate_name, candidate_age, candidate_gender, exam_name, exam_start, exam_end, exam_location, scribe_preferences, additional_info) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement st1 = con.prepareStatement(ins1, PreparedStatement.RETURN_GENERATED_KEYS);

			// Set the parameters for the prepared statement
			st1.setString(1, candidateName);
			st1.setInt(2, candidateAge);
			st1.setString(3, candidateGender);
			st1.setString(4, examName);
			st1.setString(5, examStart);
			st1.setString(6, examEnd);
			st1.setString(7, examLocation);
			st1.setString(8, scribePreferences);
			st1.setString(9, additionalInfo);

			// Execute the insert operation
			int rowsAffected = st1.executeUpdate();

			if (rowsAffected > 0) {
				System.out.println("Record inserted into 'scribe_requests' table successfully.");

			} else {
				System.out.println("Record insertion into 'scribe_requests' table failed.");
			}

			// Commit the transaction
			con.commit();
			System.out.println("Transaction committed successfully.");

		} catch (Exception e) {
			e.printStackTrace();

			
		} finally {
			try {
				if (con != null) {
					// Re-enable auto-commit before closing the connection
					con.setAutoCommit(true);
					con.close();
				}
			} catch (Exception closeEx) {
				closeEx.printStackTrace();
			}
		}
		response.sendRedirect("scribe.jsp");
	}
}
