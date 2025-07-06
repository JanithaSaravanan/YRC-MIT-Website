<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/wtproj";
    String user = "root";
    String password = "Janani@2004";
    String requestId = request.getParameter("accept_id");

    if (requestId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String updateQuery = "UPDATE blood SET status = 'confirmed' WHERE request_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);
            pstmt.setInt(1, Integer.parseInt(requestId));
            pstmt.executeUpdate();
            conn.close();
            out.print("Request Accepted Successfully");
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    }
%>
