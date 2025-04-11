<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Registration Form</title>
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

    /* Container for the login form */
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

    .input-group input,
    .input-group select {
      width: 100%;
      padding: 0.75rem;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 1rem;
    }

    /* Error styling */
    .error {
      color: red;
      font-size: 0.9em;
      margin-top: 5px;
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

    /* Signup link styling */
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
  <div class="login-container">
    <form id="myForm" class="login-form" method="post" action="./put">
      <h2>User Registration</h2>
      <div class="input-group">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required>
        <div id="idError" class="error"></div>
      </div>
      <div class="input-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="input-group">
        <label for="class">Class:</label>
        <select id="class" name="class" required>
          <option value="">Select Class</option>
          <option value="bcs">BCS</option>
          <option value="bca">BCA</option>
          <option value="others">Others</option>
        </select>
      </div>
      <div class="input-group">
        <label for="mobile">Mobile Number:</label>
        <input type="text" id="mobile" name="mobile" required>
      </div>
      <button type="submit" class="login-btn">Submit</button>
      <!-- Optional signup link -->
      <!-- <div class="signup-text">
        Don't have an account? <a href="#">Sign Up</a>
      </div> -->
    </form>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const form = document.getElementById('myForm');
      const idInput = document.getElementById('id');
      const idError = document.getElementById('idError');

      form.addEventListener('submit', function(e) {
        const idVal = idInput.value;
        // Regular expression to match exactly 10 digits
        const idPattern = /^\d{10}$/;

        if (!idPattern.test(idVal)) {
          e.preventDefault();  // Prevent form submission
          idError.textContent = "ID must be exactly 10 digits and contain only numbers.";
        } else {
          idError.textContent = "";  // Clear any error messages if valid
        }
      });
    });
  </script>
</body>
</html>
