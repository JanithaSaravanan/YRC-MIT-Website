package mityrc.user.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AddBlood")
public class AddBlood extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientName = request.getParameter("patientName");
        int patientAge = Integer.parseInt(request.getParameter("patientAge"));
        String patientGender = request.getParameter("patientGender");
        String bloodGroup = request.getParameter("bloodGroup");
        int numUnits = Integer.parseInt(request.getParameter("numUnits"));
        String location = request.getParameter("location");
        String applicantContact = request.getParameter("applicantContact");
        String applicantName = request.getParameter("applicantName");
        String additionalInfo = request.getParameter("additionalInfo");

        Connection con = null;

        try {
            // Step 1: Initialize the database connection
            con = DatabaseCon.initialiseDB();

            // Disable auto-commit for transaction management
            con.setAutoCommit(false);

            // Step 2: SQL query to insert data into the 'blood' table
            String sql = "INSERT INTO blood (patient_name, patient_age, patient_gender, blood_group, num_units, location, applicant_contact, applicant_name, additional_info, status) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = con.prepareStatement(sql);

            // Set the parameters for the prepared statement
            st.setString(1, patientName);
            st.setInt(2, patientAge);
            st.setString(3, patientGender);
            st.setString(4, bloodGroup);
            st.setInt(5, numUnits);
            st.setString(6, location);
            st.setString(7, applicantContact);
            st.setString(8, applicantName);
            st.setString(9, additionalInfo);
            st.setString(10, "Pending"); // Initial status

            // Execute the insert operation
            int rowsAffected = st.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Record inserted into 'blood' table successfully.");
                // Commit the transaction
                con.commit();
            } else {
                System.out.println("Record insertion into 'blood' table failed.");
                con.rollback(); // Rollback transaction if the insert fails
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();

            // Rollback transaction in case of any exception
            try {
                if (con != null) {
                    con.rollback();
                    System.out.println("Transaction rolled back due to an error.");
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
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

        // Redirect to the blood.jsp page after completion
        response.sendRedirect("blood.jsp");
    }
}
