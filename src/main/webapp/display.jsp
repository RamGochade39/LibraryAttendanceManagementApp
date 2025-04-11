<%@ page import="java.util.List, in.hb.model.StudentEntry" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Student Data</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}
/* Top right home button */
.home-button {
	position: absolute;
	top: 10px;
	right: 10px;
}

.home-button a {
	display: inline-block;
	padding: 10px 15px;
	background-color: #4CAF50;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	font-weight: bold;
}

.home-button a:hover {
	background-color: #45a049;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 60px auto 20px;
	/* Adjust top margin to avoid overlapping the home button */
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

form {
	margin: 0;
	display: inline-block;
}

.action-buttons {
	display: flex;
	justify-content: center;
	gap: 10px;
}
/* Styling for the Add Student box */
.add-student-box {
	width: 200px;
	padding: 15px;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #4CAF50;
	border-radius: 5px;
	background-color: #f9f9f9;
	font-weight: bold;
}

.add-student-box a {
	text-decoration: none;
	color: #4CAF50;
	display: block;
}

.add-student-box a:hover {
	color: #2e7d32;
}
</style>
<script>
	// Function for both Update and Delete actions
	function confirmAction(event, formId) {
		event.preventDefault();
		let enteredPassword = prompt("Enter the password:");
		let sessionPassword = "change123"; // Stored password
		if (enteredPassword === sessionPassword) {
			document.getElementById(formId).submit();
		} else {
			alert("Wrong password!");
		}
	}
</script>
</head>
<body>
	<!-- Home button at top right corner -->
	<div class="home-button">
		<a href="home.jsp">Home</a>
	</div>

	<h2 align="center">Student Records</h2>

	<table>
		<tr>
			<th>Serial No.</th>
			<th>Name</th>
			<th>Course</th>
			<th>Date</th>
			<th>Entry Time</th>
			<th>Exit Time</th>
			<th>Actions</th>
		</tr>
		<%
			List<StudentEntry> studentList = (List<StudentEntry>) request.getAttribute("studentList");
			int serial = 1; // Initialize counter for serial numbers
			if (studentList != null && !studentList.isEmpty()) {
				for (StudentEntry student : studentList) {
		%>
		<tr>
			<!-- Hidden input carrying the actual student.getId() -->
			<td style="display:none;">
				<input type="hidden" name="Id" value="<%= student.getId() %>" />
			</td>
			<!-- Display incremental serial number -->
			<td><%= serial++ %></td>
			<td><%= student.getStdName() %></td>
			<td><%= student.getStdCourse() %></td>
			<td><%= student.getDate() %></td>
			<td><%= student.getEntryTime() %></td>
			<td><%= student.getExitTime() %></td>
			<td class="action-buttons">
				<!-- OK Button: sends the hidden student.getId() -->
				<form action="./ok" method="post">
					<input type="hidden" name="Id" value="<%= student.getId() %>" />
					<input type="submit" value="OK" />
				</form>
				<!-- Update Button with password check: sends the hidden student.getId() -->
				<form id="updateForm_<%= student.getId() %>" action="./update" method="post">
					<input type="hidden" name="Id" value="<%= student.getId() %>" />
					<input type="submit" value="Update" style="display: none;" />
					<button type="button" onclick="confirmAction(event, 'updateForm_<%= student.getId() %>')">Update</button>
				</form>
				<!-- Delete Button with password check: sends the hidden student.getId() -->
				<form id="deleteForm_<%= student.getId() %>" action="./delete" method="post">
					<input type="hidden" name="Id" value="<%= student.getId() %>" />
					<input type="submit" value="Delete" style="display: none;" />
					<button type="button" onclick="confirmAction(event, 'deleteForm_<%= student.getId() %>')">Delete</button>
				</form>
			</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="7">No records found.</td>
		</tr>
		<%
			}
		%>
	</table>

	<!-- Add Student Link Styled as a Box -->
	<div class="add-student-box">
		<a href="attendance.jsp">Add Student</a>
	</div>
</body>
</html>
