<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registration Form</title>
<style>
/* Reset default styling */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(135deg, #74ebd5, #9face6);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Container styling for the form */
.login-container {
	background: #fff;
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
	width: 350px;
}

/* Form styling */
.login-form h2 {
	text-align: center;
	margin-bottom: 1.5rem;
	color: #333;
}

.input-group {
	margin-bottom: 1rem;
}

.input-group label {
	display: block;
	margin-bottom: 0.5rem;
	color: #555;
}

.input-group input, .input-group select {
	width: 100%;
	padding: 0.75rem;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
}

/* Error message styling */
.error-message {
	color: red;
	font-size: 0.9rem;
	margin-top: 0.5rem;
}

/* Button styling */
.login-btn {
	width: 100%;
	padding: 0.75rem;
	border: none;
	background: #74ebd5;
	color: #fff;
	font-size: 1.1rem;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.login-btn:hover {
	background: #9face6;
}

/* Link styling */
.signup-text {
	text-align: center;
	margin-top: 1rem;
}

.signup-text a {
	text-decoration: none;
	color: #74ebd5;
	font-weight: bold;
}

.signup-text a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="login-container" id="loginContainer">
		<form class="login-form" id="registrationForm" action="./store"
			method="post">
			<h2 id="formHeader">Registration Form</h2>

			<!-- ID Text Box -->
			<div class="input-group">
				<label for="idInput">ID:</label> <input type="text" id="idInput"
					name="id" placeholder="Enter your ID" required> <span
					id="idError" class="error-message"></span>
			</div>

			<%
			if (request.getAttribute("error") != null) {
			%>
			<p class="error-message"><%=request.getAttribute("error")%></p>
			<%
			}
			%>

			<!-- Submit Button -->
			<button type="submit" class="login-btn" id="submitBtn">Submit</button>
	</div>
	</form>
	</div>

	<script>
		// Get references to the form and the ID input field
		const form = document.getElementById('registrationForm');
		const idInput = document.getElementById('idInput');
		const idError = document.getElementById('idError');

		// Validate the ID field on form submission
		form
				.addEventListener(
						'submit',
						function(event) {
							// Regular expression to match exactly 10 digits
							const idPattern = /^\d{10}$/;
							if (!idPattern.test(idInput.value)) {
								idError.textContent = 'ID must be exactly 10 digits and contain only numbers.';
								event.preventDefault(); // Prevent form submission if validation fails
							} else {
								idError.textContent = ''; // Clear any previous error messages
							}
						});
	</script>
</body>
</html>
