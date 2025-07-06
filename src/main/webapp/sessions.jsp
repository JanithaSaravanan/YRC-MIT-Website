<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Youth Red Cross of MIT</title>
<link rel="icon" href="logo.png">
<link rel="stylesheet" href="adminstyles.css">
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="bg-light">
	<div class="wrapper">
		

		<div class="main p-3">
			<h1 class="py-3 fw-bold text-center">Session Details</h1>
<button id="homeButton" onclick="location.href='admin_index.html';"
    style="color: white; position: fixed; top: 20px; right: 20px; background-color: #333; border: none; border-radius: 10%; padding: 10px; font-size: 16px; cursor: pointer;">
    Home
</button>
			<div class="container mt-4">
				<h3 class="text-center mb-4">UPCOMING SESSIONS</h3>
				<div class="row">
					<!-- Loop over the upcoming sessions -->
					<c:forEach var="session" items="${adminupcomingSessions}">
						<div class="col-md-4 mb-4">
							<div class="card">
								<div class="card-body">
									<h5 class="text-dark fw-bold card-title">${session.sessionTitle}</h5>
									<p class="text-dark card-text">${session.sessionPurpose}</p>
									<p>
										<strong>Venue:</strong> ${session.venue}
									</p>
									<p>
										<strong>Start:</strong>
										<fmt:formatDate value="${session.sessionStart}" type="both"
											dateStyle="medium" timeStyle="short" />
									</p>
									<p>
										<strong>End:</strong>
										<fmt:formatDate value="${session.sessionEnd}" type="both"
											dateStyle="medium" timeStyle="short" />
									</p>

									<p>
										<strong>Organizer:</strong> ${session.organizer}
									</p>
									<p>
										<strong>Entry Fee:</strong> Rs. ${session.entryFee}
									</p>
									<p>
										<strong>Target Audience:</strong> ${session.targetAudience}
									</p>
									<p>
										<strong>Sponsors:</strong> ${session.sponsors}
									</p>
									<p>
										<strong>Special Guests:</strong> ${session.specialGuests}
									</p>
									<p>
										<strong>Additional Info:</strong> ${session.additionalInfo}
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<h3 class="text-center mb-4 mt-5">PAST SESSIONS</h3>
				<div class="row">
					<!-- Loop over the past sessions -->
					<c:forEach var="session" items="${adminpastSessions}">
						<div class="col-md-4 mb-4">
							<div class="card">
								<div class="card-body">
									<h5 class="text-dark fw-bold card-title">${session.sessionTitle}</h5>
									<p class="text-dark card-text">${session.sessionPurpose}</p>
									<p>
										<strong>Venue:</strong> ${session.venue}
									</p>
									<p>
										<strong>Start:</strong>
										<fmt:formatDate value="${session.sessionStart}" type="both"
											dateStyle="medium" timeStyle="short" />
									</p>
									<p>
										<strong>End:</strong>
										<fmt:formatDate value="${session.sessionEnd}" type="both"
											dateStyle="medium" timeStyle="short" />
									</p>

									<p>
										<strong>Organizer:</strong> ${session.organizer}
									</p>
									<p>
										<strong>Entry Fee:</strong> Rs. ${session.entryFee}
									</p>
									<p>
										<strong>Target Audience:</strong> ${session.targetAudience}
									</p>
									<p>
										<strong>Sponsors:</strong> ${session.sponsors}
									</p>
									<p>
										<strong>Special Guests:</strong> ${session.specialGuests}
									</p>
									<p>
										<strong>Additional Info:</strong> ${session.additionalInfo}
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<button id="requestButton" onclick="location.href='admin_session.jsp';"
					style="color: white; position: fixed; bottom: 20px; right: 20px; background-color: black; color: white; border: none; border-radius: 50%; padding: 25px; font-size: 16px; cursor: pointer;">
					+</button>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
	<script src="script.js"></script>
</body>
</html>
