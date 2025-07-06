package mityrc.user.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/UserSessionServlet")
public class UserSessionServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    Connection con = null;
    PreparedStatement st1 = null;
  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Session> upcomingSessions = new ArrayList<>();
        List<Session> pastSessions = new ArrayList<>();
        Connection conn = null;
        
        // Database connection and queries
        try {
            conn = DatabaseCon.initialiseDB();
            
            // Update session status query
            String updateQuery = "UPDATE sessions SET status = CASE " +
                                 "WHEN session_end < NOW() THEN 'inactive' " +
                                 "ELSE 'active' END";
            try (Statement stmt = conn.createStatement()) {
                stmt.executeUpdate(updateQuery); // This will update session status based on the session_end time
            }

            // Query to fetch upcoming sessions (active ones)
            String queryUpcoming = "SELECT * FROM sessions WHERE status = 'active'";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(queryUpcoming)) {
                while (rs.next()) {
                    Session session = new Session(
                        rs.getInt("id"),
                        rs.getString("session_title"),
                        rs.getString("session_purpose"),
                        rs.getString("venue"),
                        rs.getTimestamp("session_start"),
                        rs.getTimestamp("session_end"),
                        rs.getString("target_audience"),
                        rs.getDouble("entry_fee"),
                        rs.getString("organizer"),
                        rs.getString("sponsors"),
                        rs.getString("special_guests"),
                        rs.getString("additional_info"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"),
                        rs.getString("status")
                    );
                    upcomingSessions.add(session);
                }
            }

            // Query to fetch past sessions (inactive ones)
            String queryPast = "SELECT * FROM sessions WHERE status = 'inactive'";
            try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(queryPast)) {
                while (rs.next()) {
                    Session session = new Session(
                        rs.getInt("id"),
                        rs.getString("session_title"),
                        rs.getString("session_purpose"),
                        rs.getString("venue"),
                        rs.getTimestamp("session_start"),
                        rs.getTimestamp("session_end"),
                        rs.getString("target_audience"),
                        rs.getDouble("entry_fee"),
                        rs.getString("organizer"),
                        rs.getString("sponsors"),
                        rs.getString("special_guests"),
                        rs.getString("additional_info"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"),
                        rs.getString("status")
                    );
                    pastSessions.add(session);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Forward both lists of sessions to the JSP for rendering
        request.setAttribute("upcomingSessions", upcomingSessions);
        request.setAttribute("pastSessions", pastSessions);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("usersessions.jsp");
        dispatcher.forward(request, response);
    }

    // Session class to hold session data
    public static class Session {
        private int id;
        private String sessionTitle;
        private String sessionPurpose;
        private String venue;
        private Timestamp sessionStart;
        private Timestamp sessionEnd;
        private String targetAudience;
        private double entryFee;
        private String organizer;
        private String sponsors;
        private String specialGuests;
        private String additionalInfo;
        private Timestamp createdAt;
        private Timestamp updatedAt;
        private String status;

        public Session(int id, String sessionTitle, String sessionPurpose, String venue, Timestamp sessionStart, Timestamp sessionEnd,
                       String targetAudience, double entryFee, String organizer, String sponsors, String specialGuests,
                       String additionalInfo, Timestamp createdAt, Timestamp updatedAt, String status) {
            this.id = id;
            this.sessionTitle = sessionTitle;
            this.sessionPurpose = sessionPurpose;
            this.venue = venue;
            this.sessionStart = sessionStart;
            this.sessionEnd = sessionEnd;
            this.targetAudience = targetAudience;
            this.entryFee = entryFee;
            this.organizer = organizer;
            this.sponsors = sponsors;
            this.specialGuests = specialGuests;
            this.additionalInfo = additionalInfo;
            this.createdAt = createdAt;
            this.updatedAt = updatedAt;
            this.status = status;
        }

        // Getters for all fields
        public int getId() { return id; }
        public String getSessionTitle() { return sessionTitle; }
        public String getSessionPurpose() { return sessionPurpose; }
        public String getVenue() { return venue; }
        public Timestamp getSessionStart() { return sessionStart; }
        public Timestamp getSessionEnd() { return sessionEnd; }
        public String getTargetAudience() { return targetAudience; }
        public double getEntryFee() { return entryFee; }
        public String getOrganizer() { return organizer; }
        public String getSponsors() { return sponsors; }
        public String getSpecialGuests() { return specialGuests; }
        public String getAdditionalInfo() { return additionalInfo; }
        public Timestamp getCreatedAt() { return createdAt; }
        public Timestamp getUpdatedAt() { return updatedAt; }
        public String getStatus() { return status; }
    }
}
