package mityrc.user.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/CreateSession")
public class CreateSession extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String sessionTitle = request.getParameter("sessionTitle");
        String sessionPurpose = request.getParameter("sessionPurpose");
        String venue = request.getParameter("venue");
        String sessionStart = request.getParameter("sessionStart");
        String sessionEnd = request.getParameter("sessionEnd");
        String audience = request.getParameter("audience");
        int entryFee = Integer.parseInt(request.getParameter("entryFee"));
        String organizer = request.getParameter("organizer");
        String sponsors = request.getParameter("sponsors");
        String specialGuests = request.getParameter("specialGuests");
        String additionalInfo = request.getParameter("additionalInfo");

        Connection con = null;
        PreparedStatement st1 = null;

        try {
            // Step 1: Initialize the database connection
            con = DatabaseCon.initialiseDB();
            
            // Step 2: Disable auto-commit for transaction management
            con.setAutoCommit(false);

            // Step 3: SQL query to insert data into the 'sessions' table
            String ins1 = "INSERT INTO sessions (session_title, session_purpose, venue, session_start, session_end, target_audience, entry_fee, organizer, sponsors, special_guests, additional_info) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            st1 = con.prepareStatement(ins1, PreparedStatement.RETURN_GENERATED_KEYS);

            // Set the parameters for the prepared statement
            st1.setString(1, sessionTitle);
            st1.setString(2, sessionPurpose);
            st1.setString(3, venue);
            st1.setString(4, sessionStart);
            st1.setString(5, sessionEnd);
            st1.setString(6, audience);
            st1.setInt(7, entryFee); // If entry fee is not provided, set it to 0
            st1.setString(8, organizer);
            st1.setString(9, sponsors);
            st1.setString(10, specialGuests);
            st1.setString(11, additionalInfo);

            // Execute the insert operation
            int rowsAffected = st1.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Session post inserted successfully into 'sessions' table.");
            } else {
                System.out.println("Session post insertion failed.");
            }

            // Commit the transaction
            con.commit();
            System.out.println("Transaction committed successfully.");

        } catch (SQLException e) {
            // Handle errors (rollback in case of exception)
            if (con != null) {
                try {
                    con.rollback();
                    System.out.println("Rollback completed.");
                } catch (SQLException ex) {
                    System.out.println("Rollback failed: " + ex.getMessage());
                }
            }
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            // Ensure the resources are closed after use
            try {
                if (st1 != null) {
                    st1.close();
                }
                if (con != null && !con.isClosed()) {
                    con.setAutoCommit(true); // Reset auto-commit to true for future queries
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Redirect to the appropriate page after processing
        response.sendRedirect("SessionServlet");
    }
}
