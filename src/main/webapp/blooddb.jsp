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
        .no-data { color: red; font-size: 18px; }
        .accept-btn { background-color: #4CAF50; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; }
        .accept-btn:hover { background-color: #45a049; }
        table { width: 100%; border-collapse: collapse; margin-top: 30px; }
        table, th, td { border: 1px solid #ccc; }
        th, td { padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .table-title { font-size: 20px; margin-top: 40px; }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function acceptRequest(requestId) {
            // Send AJAX request to update the status of the blood request
            $.ajax({
                url: 'acceptRequest.jsp', // URL for the servlet or JSP to handle the request
                type: 'POST',
                data: { accept_id: requestId },
                success: function(response) {
                    // On success, update the status on the page
                    $('#status-' + requestId).text('Accepted');
                    $('#accept-btn-' + requestId).prop('disabled', true); // Disable the Accept button
                },
                error: function(xhr, status, error) {
                    alert('Error: ' + error);
                }
            });
        }
    </script>
</head>
<body>
    <h1>Blood Request Details</h1>
    
    <button id="homeButton" onclick="location.href='admin_index.html';"
    style="color: white; position: fixed; top: 20px; right: 20px; background-color: #333; border: none; border-radius: 10%; padding: 10px; font-size: 16px; cursor: pointer;">
    Home
</button>

    
    
    <%-- Fetch pending blood requests --%>
    <%
        String url = "jdbc:mysql://localhost:3306/wtproj";
        String user = "root";
        String password = "Janani@2004";
        
        String query = "SELECT request_id, patient_name, patient_age, patient_gender, " +
                       "blood_group, num_units, location, applicant_contact, applicant_name, additional_info, status " +
                       "FROM blood WHERE status = 'pending'";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            boolean hasData = false;

            while (rs.next()) {
                hasData = true;
    %>
                <div class="request-card">
                    <h3>Request ID: <%= rs.getInt("request_id") %></h3>
                    <p><strong>Patient Name:</strong> <%= rs.getString("patient_name") %></p>
                    <p><strong>Age:</strong> <%= rs.getInt("patient_age") %></p>
                    <p><strong>Gender:</strong> <%= rs.getString("patient_gender") %></p>
                    <p><strong>Blood Group:</strong> <%= rs.getString("blood_group") %></p>
                    <p><strong>Units Needed:</strong> <%= rs.getInt("num_units") %></p>
                    <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                    <p><strong>Applicant Contact:</strong> <%= rs.getString("applicant_contact") %></p>
                    <p><strong>Applicant Name:</strong> <%= rs.getString("applicant_name") %></p>
                    <p><strong>Additional Info:</strong> <%= rs.getString("additional_info") %></p>
                    <p><strong>Status:</strong> <span id="status-<%= rs.getInt("request_id") %>"><%= rs.getString("status") %></span></p>
                    <button id="accept-btn-<%= rs.getInt("request_id") %>" class="accept-btn" onclick="acceptRequest(<%= rs.getInt("request_id") %>)">Accept</button>
                </div>
    <%
            }
            if (!hasData) {
                out.println("<p class='no-data'>No pending blood requests found.</p>");
            }
            conn.close();
        } catch (Exception e) {
            out.println("<p class='no-data'>Error: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>
