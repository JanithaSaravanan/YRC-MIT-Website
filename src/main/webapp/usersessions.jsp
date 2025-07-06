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
<link rel="stylesheet" href="style.css">
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="bg-light">
	<div class="wrapper">
		<aside id="sidebar">
			<!-- Sidebar content here -->
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
				<!-- <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="lni lni-cog"></i>
                            <span>Setting</span>
                        </a>
                    </li> -->
			</ul>
		</aside>

		<div class="main p-3">
			<h1 class="py-3 text-center">MIT YRC - Health. Service.
				Friendship.</h1>

			<div class="container mt-4">
				<h3 class="text-center mb-4">UPCOMING SESSIONS</h3>
				<div class="row">
					<!-- Loop over the upcoming sessions -->
					<c:forEach var="session" items="${upcomingSessions}">
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
					<c:forEach var="session" items="${pastSessions}">
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
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
	<script src="script.js"></script>
</body>
</html>
