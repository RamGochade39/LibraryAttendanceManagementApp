<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Prevent caching on the server side.
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    // If user is already logged in, redirect them to the home page.
    if (session.getAttribute("user") != null) {
        response.sendRedirect("home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <!-- Meta tags to prevent caching on the client side -->
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="0">
  <style>
    .error-message {
      color: red;
      font-size: 14px;
      margin-top: 5px;
    }
  </style>
  <script type="text/javascript">
    // This function attempts to force the browser to move forward in its history.
    function preventBack() {
       window.history.forward();
    }
    setTimeout(preventBack, 0);
    window.onunload = function () { null };
  </script>
</head>
<body onload="preventBack();">
  <div class="login-container">
    <form class="login-form" action="./test" method="post">
      <h2>Login</h2>
      <div class="input-group">
        <label for="username">Email</label>
        <input type="text" id="username" name="email" required placeholder="Enter your Email">
      </div>
      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required placeholder="Enter your password">
      </div>
      <% if (request.getAttribute("errorMessage") != null) { %>
        <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
      <% } %>
      <button type="submit" class="login-btn">Login</button>
      <p class="signup-text">Don't have an account? <a href="signup.jsp">Sign Up</a></p>
    </form>
  </div>
</body>
</html>
