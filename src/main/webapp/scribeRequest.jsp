<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Youth Red Cross of MIT</title>
<link rel="icon" href="logo.png">

    
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 20px; }
        .request-card { border: 1px solid #ccc; padding: 15px; margin-bottom: 15px; background-color: #fff; border-radius: 8px; }
        .request-card h3 { margin-top: 0; color: #333; }
        .no-data { color: red; font-size: 18px; text-align: center; }
        .accept-btn { background-color: #4CAF50; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; }
        .accept-btn:hover { background-color: #45a049; }
        h2 { margin-top: 30px; }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function acceptRequest(requestId) {
            $.ajax({
                url: 'acceptScribeRequest.jsp',
                type: 'POST',
                data: { accept_id: requestId },
                success: function(response) {
                    location.reload(); // Refresh the page to reflect updated sections
                },
                error: function(xhr, status, error) {
                    alert('Error: ' + error);
                }
            });
        }
    </script>
</head>
<body>
    <h1>Scribe Request Details</h1>
    <button id="homeButton" onclick="location.href='admin_index.html';"
    style="color: white; position: fixed; top: 20px; right: 20px; background-color: #333; border: none; border-radius: 10%; padding: 10px; font-size: 16px; cursor: pointer;">
    Home
</button>
    <!-- Pending Requests Section -->
    <h2>Pending Scribe Requests</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/wtproj";
        String user = "root";
        String password = "Janani@2004";
        
        String pendingQuery = "SELECT * FROM scribe_requests WHERE status = 'Pending'";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            ResultSet rsPending = stmt.executeQuery(pendingQuery);

            boolean hasPendingData = false;
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a");

            while (rsPending.next()) {
                hasPendingData = true;
    %>
                <div class="request-card">
                    <h3>Request ID: <%= rsPending.getInt("request_id") %></h3>
                    <p><strong>Candidate Name:</strong> <%= rsPending.getString("candidate_name") %></p>
                    <p><strong>Age:</strong> <%= rsPending.getInt("candidate_age") %></p>
                    <p><strong>Gender:</strong> <%= rsPending.getString("candidate_gender") %></p>
                    <p><strong>Exam Name:</strong> <%= rsPending.getString("exam_name") %></p>
                    <p><strong>Exam Start:</strong> <%= sdf.format(rsPending.getTimestamp("exam_start")) %></p>
                    <p><strong>Exam End:</strong> <%= sdf.format(rsPending.getTimestamp("exam_end") ) %></p>
                    <p><strong>Location:</strong> <%= rsPending.getString("exam_location") %></p>
                    <p><strong>Scribe Preferences:</strong> <%= rsPending.getString("scribe_preferences") %></p>
                    <p><strong>Additional Info:</strong> <%= rsPending.getString("additional_info") %></p>
                    <p><strong>Status:</strong> <%= rsPending.getString("status") %></p>
                    <button class="accept-btn" onclick="acceptRequest(<%= rsPending.getInt("request_id") %>)">Accept</button>
                </div>
    <%
            }
            if (!hasPendingData) {
                out.println("<p class='no-data'>No pending scribe requests found.</p>");
            }
    %>

    <!-- Confirmed Requests Section -->
    <h2>Confirmed Scribe Requests</h2>
    <%
        String confirmedQuery = "SELECT * FROM scribe_requests WHERE status = 'Accepted'";
        ResultSet rsConfirmed = stmt.executeQuery(confirmedQuery);

        boolean hasConfirmedData = false;

        while (rsConfirmed.next()) {
            hasConfirmedData = true;
    %>
            <div class="request-card">
                <h3>Request ID: <%= rsConfirmed.getInt("request_id") %></h3>
                <p><strong>Candidate Name:</strong> <%= rsConfirmed.getString("candidate_name") %></p>
                <p><strong>Age:</strong> <%= rsConfirmed.getInt("candidate_age") %></p>
                <p><strong>Gender:</strong> <%= rsConfirmed.getString("candidate_gender") %></p>
                <p><strong>Exam Name:</strong> <%= rsConfirmed.getString("exam_name") %></p>
                <p><strong>Exam Start:</strong> <%= rsConfirmed.getTimestamp("exam_start") %></p>
                <p><strong>Exam End:</strong> <%= rsConfirmed.getTimestamp("exam_end") %></p>
                <p><strong>Location:</strong> <%= rsConfirmed.getString("exam_location") %></p>
                <p><strong>Scribe Preferences:</strong> <%= rsConfirmed.getString("scribe_preferences") %></p>
                <p><strong>Additional Info:</strong> <%= rsConfirmed.getString("additional_info") %></p>
                <p><strong>Status:</strong> Accepted</p>
            </div>
    <%
        }
        if (!hasConfirmedData) {
            out.println("<p class='no-data'>No confirmed scribe requests found.</p>");
        }
        conn.close();
    } catch (Exception e) {
        out.println("<p class='no-data'>Error: " + e.getMessage() + "</p>");
    }
    %>
</body>
</html>
