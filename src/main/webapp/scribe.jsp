<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Youth Red Cross of MIT</title>
<link rel="icon" href="logo.png">
<link rel="stylesheet" href="style.css">
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
table {
	width: 90%;
	margin: 20px auto;
	border-collapse: collapse;
	font-size: 16px;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: left;
}

tr > th{
color: black !important; 
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}
</style>
</head>
<!-- Current Body -->
<body class="bg-light">

	<div class="wrapper">

		<!-- Sidebar -->
		<aside id="sidebar">
			<div class="d-flex">
				<button class="toggle-btn" type="button">
					<img src="logo.png" alt="icon" class="icon-image">
				</button>
				<div class="sidebar-logo">
					<a href="index.html">MIT YRC</a>
				</div>
			</div>
			<ul class="sidebar-nav">
				<li class="sidebar-item"><a href="index.html" class="sidebar-link">
						<i class="lni lni-user"></i> <span>Home Page</span>
				</a></li>
				<li class="sidebar-item"><a href="UserSessionServlet" class="sidebar-link">
						<i class="lni lni-users"></i> <span>Sessions</span>
				</a></li>
				<li class="sidebar-item"><a href="blood.jsp"
					class="sidebar-link"> <i class="lni lni-heart"></i> <span>Request
							Blood</span>
				</a></li>
				<li class="sidebar-item"><a href="scribe.jsp"
					class="sidebar-link"> <i class="lni lni-eye"></i> <span>Request
							a Scribe</span>
				</a></li>
				<li class="sidebar-item"><a href="gallery.html"
					class="sidebar-link"> <i class="lni lni-gallery"></i> <span>View
							Gallery</span>
				</a></li>
				<!-- <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="lni lni-cog"></i>
                            <span>Setting</span>
                        </a>
                    </li> -->
			</ul>
		</aside>

		<!-- Main Content -->
		<div class="main p-3">
			<div class="text-center">
				<!-- Heading -->
				<h1 class="py-3">MIT YRC - Health. Service. Friendship.</h1>
				<h3 class="text-center mt-4 mb-4">SCRIBE REQUESTS</h3>
				
				<!-- Table -->
				<table>
					<thead>
						<tr>
							<th>Request ID</th>
							<th>Candidate Name</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Exam Name</th>
							<th>Exam Start</th>
							<th>Exam End</th>
							<th>Exam Location</th>
							<th>Scribe Preferences</th>
							<th>Additional Info</th>
							<th>Status</th>
							<th>Created At</th>
							<th>Last Updated</th>
						</tr>
					</thead>
					<tbody>
						<%
						Connection con = null;
						Statement statement = null;
						ResultSet resultSet = null;

						try {
							String url = "jdbc:mysql://localhost:3306/";
							String dbname = "wtproj";
							String username = "root";
							String password = "";

							Class.forName("com.mysql.jdbc.Driver");
							con = DriverManager.getConnection(url + dbname, username, password);
							
							
						        
						                // SQL query to fetch data from scribe_requests table
						                String query = "SELECT request_id, candidate_name, candidate_age, candidate_gender, exam_name, "
						                             + "exam_start, exam_end, exam_location, scribe_preferences, additional_info, "
						                             + "status, created_at, updated_at "
						                             + "FROM scribe_requests";

						                // Execute query
						                statement = con.createStatement();
						                resultSet = statement.executeQuery(query);
										java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a");


						                // Loop through the result set and generate table rows
						                while (resultSet.next()) {
						        %>


						<tr>
							<td><%= resultSet.getInt("request_id") %></td>
							<td><%= resultSet.getString("candidate_name") %></td>
							<td><%= resultSet.getInt("candidate_age") %></td>
							<td><%= resultSet.getString("candidate_gender") %></td>
							<td><%= resultSet.getString("exam_name") %></td>
							<td><%= sdf.format(resultSet.getTimestamp("exam_start")) %></td>
							<td><%= sdf.format(resultSet.getTimestamp("exam_end")) %></td>
							<td><%= resultSet.getString("exam_location") %></td>
							<td><%= resultSet.getString("scribe_preferences") %></td>
							<td><%= resultSet.getString("additional_info") %></td>
							<td><%= resultSet.getString("status") %></td>
							<td><%= sdf.format(resultSet.getTimestamp("created_at")) %></td>
							<td><%= sdf.format(resultSet.getTimestamp("updated_at")) %></td>
						</tr>
						<%
						}
						} catch (Exception e) {
						// Handle and display error if any
						out.println("<tr><td colspan='13' style='color: red; text-align: center;'>Error fetching data: " + e.getMessage()
								+ "</td></tr>");
						} finally {
						// Close resources
						if (resultSet != null)
						try {
							resultSet.close();
						} catch (SQLException ignore) {
						}
						if (statement != null)
						try {
							statement.close();
						} catch (SQLException ignore) {
						}
						if (con != null)
						try {
							con.close();
						} catch (SQLException ignore) {
						}
						}
						%>
					</tbody>
				</table>

				<button id="requestButton" onclick="location.href='add_scribe.html';"
					style="color: white; position: fixed; bottom: 20px; right: 20px; background-color: red; color: white; border: none; border-radius: 50%; padding: 25px; font-size: 16px; cursor: pointer;">
					+</button>


			</div>
		</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="script.js"></script>
</body>

</html>
