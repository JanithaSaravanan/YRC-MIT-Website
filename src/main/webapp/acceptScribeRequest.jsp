<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/wtproj";
    String user = "root";
    String password = "Janani@2004";

    String requestId = request.getParameter("accept_id");

    if (requestId != null && !requestId.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            String updateQuery = "UPDATE scribe_requests SET status = 'Accepted' WHERE request_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);
            pstmt.setInt(1, Integer.parseInt(requestId));
            
            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
                out.print("Request accepted successfully.");
            } else {
                out.print("Failed to update request status.");
            }

            conn.close();
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    } else {
        out.print("Invalid request ID.");
    }
%>
