<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <link rel="stylesheet" type="text/css" href="style1.css">
  <script>
    function validateForm() {
      let email = document.getElementById("username");
      let password = document.getElementById("password");
      let emailError = document.getElementById("emailError");
      let passwordError = document.getElementById("passwordError");
      let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      let isValid = true;
      
      emailError.textContent = "";
      passwordError.textContent = "";
      
      if (!emailPattern.test(email.value)) {
        emailError.textContent = "Please enter a valid email address.";
        isValid = false;
      }
      
      if (password.value.length < 8) {
        passwordError.textContent = "Password must be at least 8 characters long.";
        isValid = false;
      }
      
      return isValid;
    }
  </script>
  <style>
    .error-message {
      color: red;
      font-size: 12px;
      margin-top: 5px;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <form class="login-form" action="./signup" method="get" onsubmit="return validateForm()">
      <h2>Sign Up</h2>
      <div class="input-group">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required placeholder="Enter your full name">
      </div>
      <div class="input-group">
        <label for="username">Email</label>
        <input type="text" id="username" name="username" required placeholder="Enter your email">
        <div id="emailError" class="error-message"></div>
      </div>
      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required placeholder="Enter your password">
        <div id="passwordError" class="error-message"></div>
      </div>
      <button type="submit" class="login-btn">Sign Up</button>
      <p class="signup-text">Already have an account? <a href="login.jsp">Login</a></p>
    </form>
  </div>
</body>
</html>
