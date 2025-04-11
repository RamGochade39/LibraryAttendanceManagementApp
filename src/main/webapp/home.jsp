<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Ensure the operator is logged in.
    if(session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    // Retrieve the operator's name (or email) from the session.
    String operatorName = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Dashboard - Library Operator</title>
   <link rel="stylesheet" type="text/css" href="style2.css">
   <!-- Google Fonts for enhanced typography -->
   <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
   <div class="dashboard">
      <!-- Sidebar Navigation -->
      <nav class="sidebar">
         <div class="logo">
            <h2>Library</h2>
         </div>
         <ul>
            <li><a href="dashboard.jsp">Dashboard</a></li>
            <li><a href="attendance.jsp">Record Attendance</a></li>
            <li><a href="manage.jsp">Manage Records</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a href="settings.jsp">Settings</a></li>
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
      </nav>
      <!-- Main Content -->
      <main class="main-content">
         <header class="header">
            <h1>Welcome, <%= operatorName %>!</h1>
            <p>Manage library attendance and more with ease.</p>
         </header>
         <!-- Cards Section for Operations -->
         <section class="cards">
            <div class="card">
               <h3>Record Attendance</h3>
               <p>Check-in or check-out students quickly.</p>
               <a href="attendance.jsp" class="btn">Go Now</a>
            </div>
            <div class="card">
               <h3>See Records</h3>
               <p>Check attendance entries.</p>
               <a href="display.jsp" class="btn">Manage</a>
            </div>
            <div class="card">
               <h3>Generate Reports</h3>
               <p>View daily and monthly attendance reports.</p>
               <a href="reports.jsp" class="btn">View Reports</a>
            </div>
            <div class="card">
               <h3>Add New Student</h3>
               <p>Add new student or delete student.</p>
               <a href="addstudent.jsp" class="btn">Add</a>
            </div>
         </section>
      </main>
   </div>
</body>
</html>
