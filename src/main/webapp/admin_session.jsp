<!DOCTYPE html>
<html>
<head>
<title>Youth Red Cross of MIT</title>
<link rel="icon" href="logo.png">
<link rel="stylesheet" href="stylesadmin.css">
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>/* Replace red background color with grey */
*{
font-family: Arial;
}
.session-icon {
  background-color: #808080; /* Grey color */
  color: white;
}

/* Update hover states if any red color is used */
.logout-link:hover {
  color: #808080; /* Grey color on hover */
}
</style>
<body class="bg-light">

	<div class="wrapper">


		<!-- Main Content -->
		<div class="main p-3">
			<div>
				
				<!-- Scribe Request Form -->
				<div class="container">
                    <h2 class="fw-bold text-center mb-4">Session Post - Creation Form</h2>
                    <form id="sessionForm" method="POST" action="CreateSession">
                        <div class="mb-3">
                            <label for="sessionTitle" class="form-label">Session Title</label>
                            <input type="text" class="form-control" id="sessionTitle" name="sessionTitle" placeholder="Enter the session title" required>
                        </div>
                        <div class="mb-3">
                            <label for="sessionPurpose" class="form-label">Session Purpose</label>
                            <textarea class="form-control" id="sessionPurpose" name="sessionPurpose" rows="2" placeholder="Describe the purpose of the session" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="venue" class="form-label">Venue</label>
                            <input type="text" class="form-control" id="venue" name="venue" placeholder="Enter the venue" required>
                        </div>
                        <div class="mb-3">
                            <label for="sessionDate" class="form-label">Session Timings</label>
                            <input type="datetime-local" class="form-control" id="sessionStart" name="sessionStart" required>
                            <input type="datetime-local" class="form-control mt-2" id="sessionEnd" name="sessionEnd" required>
                        </div>
                        <div class="mb-3">
                            <label for="audience" class="form-label">Target Audience</label>
                            <input type="text" class="form-control" id="audience" name="audience" placeholder="E.g., volunteers, public, visually challenged, etc." required>
                        </div>
                        <div class="mb-3">
                            <label for="entryFee" class="form-label">Entry Fee (if any)</label>
                            <input type="number" class="form-control" id="entryFee" name="entryFee" placeholder="Enter the entry fee amount (0 if free)">
                        </div>
                        <div class="mb-3">
                            <label for="organizer" class="form-label">Organizers</label>
                            <input type="text" class="form-control" id="organizer" name="organizer" placeholder="Enter the name of the organizer(s) (collaborators, if any)" required>
                        </div>
                        <div class="mb-3">
                            <label for="sponsors" class="form-label">Sponsors (if any)</label>
                            <textarea class="form-control" id="sponsors" name="sponsors" rows="2" placeholder="Mention sponsors if applicable"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="specialGuests" class="form-label">Special Guests (if any)</label>
                            <textarea class="form-control" id="specialGuests" name="specialGuests" rows="2" placeholder="List any special guests for the session"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="additionalInfo" class="form-label">Additional Information</label>
                            <textarea class="form-control" id="additionalInfo" name="additionalInfo" rows="3" placeholder="Any additional information about the session"></textarea>
                        </div>
                        <div class="mb-3 text-center">
                            <button type="submit" class="btn btn-dark" onclick="return handleValidation()">Create Post</button>
                        </div>
                    </form>
                </div>

			</div>
		</div>
	</div>
	<script>
        function handleValidation() {
            const sessionTitle = document.getElementById('sessionTitle').value.trim();
            const sessionPurpose = document.getElementById('sessionPurpose').value.trim();
            const venue = document.getElementById('venue').value.trim();
            const sessionStart = document.getElementById('sessionStart').value;
            const sessionEnd = document.getElementById('sessionEnd').value;
            const audience = document.getElementById('audience').value.trim();
            const entryFee = document.getElementById('entryFee').value.trim();
            const organizer = document.getElementById('organizer').value.trim();

            if (!sessionTitle) {
                alert("Session Title is required.");
                return false;
            }

            if (!sessionPurpose) {
                alert("Session Purpose is required.");
                return false;
            }

            if (!venue) {
                alert("Venue is required.");
                return false;
            }

            if (!sessionStart) {
                alert("Session Start time is required.");
                return false;
            }

            if (!sessionEnd) {
                alert("Session End time is required.");
                return false;
            }

            if (new Date(sessionStart) >= new Date(sessionEnd)) {
                alert("Session End time must be after the Start time.");
                return false;
            }

            if (!audience) {
                alert("Target Audience is required.");
                return false;
            }

            if (entryFee && isNaN(entryFee)) {
                alert("Entry Fee must be a number.");
                return false;
            }

            if (!organizer) {
                alert("Organizer(s) name is required.");
                return false;
            }

            // Success alert
            alert("Your request has been successfully submitted!");
            return true; // Allow form submission
        }
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="script.js"></script>
</body>
</html>