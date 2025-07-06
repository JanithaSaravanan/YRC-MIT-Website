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
<body class="bg-light">

	<div class="wrapper">

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
				<li class="sidebar-item"><a href="index.html"
					class="sidebar-link"> <i class="lni lni-user"></i> <span>Home
							Page</span>
				</a></li>
				<li class="sidebar-item"><a href="UserSessionServlet"
					class="sidebar-link"> <i class="lni lni-users"></i> <span>Sessions</span>
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
			</ul>
		</aside>

		<div class="main p-3">
			<div class="text-center">
				<h1 class="py-3">MIT YRC - Health. Service. Friendship.</h1>
				<h3 class="text-center mt-4 mb-4">BLOOD REQUESTS</h3>

				<table>
					<thead>
						<tr>
							<th>Request ID</th>
							<th>Patient Name</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Blood Group</th>
							<th>Units Needed</th>
							<th>Location</th>
							<th>Applicant Contact</th>
							<th>Applicant Name</th>
							<th>Additional Info</th>
							<th>Created At</th>
							<th>Last Updated</th>
							<th>Status</th>
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

                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url + dbname, username, password);

                String query = "SELECT request_id, patient_name, patient_age, patient_gender, blood_group, " +
                               "num_units, location, applicant_contact, applicant_name, additional_info, " +
                               "created_at, updated_at, status " +
                               "FROM blood";

                statement = con.createStatement();
                resultSet = statement.executeQuery(query);

                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a");

                while (resultSet.next()) {
        %>
						<tr>
							<td><%= resultSet.getInt("request_id") %></td>
							<td><%= resultSet.getString("patient_name") %></td>
							<td><%= resultSet.getInt("patient_age") %></td>
							<td><%= resultSet.getString("patient_gender") %></td>
							<td><%= resultSet.getString("blood_group") %></td>
							<td><%= resultSet.getInt("num_units") %></td>
							<td><%= resultSet.getString("location") %></td>
							<td><%= resultSet.getString("applicant_contact") %></td>
							<td><%= resultSet.getString("applicant_name") %></td>
							<td><%= resultSet.getString("additional_info") %></td>
							<td><%= sdf.format(resultSet.getTimestamp("created_at")) %></td>
							<td><%= sdf.format(resultSet.getTimestamp("updated_at")) %></td>
							<td><%= resultSet.getString("status") %></td>
						</tr>
						<%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='13' style='color: red; text-align: center;'>Error fetching data: " + e.getMessage() + "</td></tr>");
            } finally {
                if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
                if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
                if (con != null) try { con.close(); } catch (SQLException ignore) {}
            }
        %>
					</tbody>
				</table>


				<button id="requestButton" onclick="location.href='add_blood.html';"
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
