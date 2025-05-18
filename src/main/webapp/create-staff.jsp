<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Staff Registration</title>
  <style>
    :root {
      --primary: #E2725B;        /* Warm Terracotta */
      --secondary: #F5F5DC;      /* Creamy Beige */
      --accent1: #A0522D;        /* Toasted Brown */
      --accent2: #FFDAB9;        /* Soft Peach */
      --dark-bg: #FFF5E9;        /* Light cream background variant */
    }

    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--secondary);
      color: var(--accent1);
    }

    .container {
      width: 90%;
      max-width: 800px;
      margin: 40px auto 60px auto;
      padding: 30px 25px;
      background: white;
      border-radius: 15px;
      box-shadow: 0 6px 20px rgba(160, 82, 45, 0.2);
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      color: var(--primary);
      font-weight: 700;
      font-size: 2.2rem;
      margin-bottom: 35px;
      letter-spacing: 1.1px;
    }

    .success-message, .error-message {
      padding: 12px;
      margin-bottom: 20px;
      border-radius: 6px;
      font-weight: 700;
      font-size: 1rem;
    }

    .success-message {
      background-color: var(--accent1);
      border-left: 5px solid var(--primary);
      color: var(--accent2);
    }

    .error-message {
      background-color: var(--primary);
      border-left: 5px solid var(--accent1);
      color: var(--secondary);
    }

    label {
      display: block;
      margin-top: 15px;
      margin-bottom: 6px;
      font-weight: 600;
      color: var(--accent1);
    }

    input, select, textarea {
      width: 100%;
      padding: 10px 12px;
      background-color: var(--accent2);
      border: 1px solid var(--primary);
      border-radius: 6px;
      color: var(--accent1);
      font-size: 15px;
      transition: border-color 0.3s ease;
      box-sizing: border-box;
      font-family: inherit;
    }

    input:focus, select:focus, textarea:focus {
      border-color: var(--accent1);
      outline: none;
      background-color: #fff1e6;
    }

    input[type="submit"] {
      background-color: var(--primary);
      color: var(--secondary);
      font-weight: 700;
      margin-top: 25px;
      padding: 12px;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease, color 0.3s ease;
      box-shadow: 0 4px 8px rgba(160, 82, 45, 0.4);
      width: 100%;
    }

    input[type="submit"]:hover {
      background-color: var(--accent1);
      color: var(--accent2);
      box-shadow: 0 6px 12px rgba(226, 114, 91, 0.7);
    }

    @media (max-width: 600px) {
      .container {
        padding: 20px 15px;
      }
    }
  </style>
</head>
<body>

<jsp:include page="admin-header.jsp" />
<br>
<br>
<br>
<div class="container">
  <h2>Staff Registration</h2>

  <!-- Success/Error Message -->
  <c:if test="${param.status == 'success'}">
    <div class="success-message">Staff registered successfully!</div>
  </c:if>
  <c:if test="${param.status == 'error'}">
    <div class="error-message">Error occurred while registering staff.</div>
  </c:if>

  <!-- Form -->
  <form action="StaffRegisterServlet" method="POST">
    <label for="first_name">First Name *</label>
    <input type="text" id="first_name" name="first_name" required>

    <label for="last_name">Last Name *</label>
    <input type="text" id="last_name" name="last_name" required>

    <label for="username">Username *</label>
    <input type="text" id="username" name="username" required>

    <label for="phone">Phone</label>
    <input type="text" id="phone" name="phone">

    <label for="email">Email *</label>
    <input type="email" id="email" name="email" required>

    <label for="password">Password *</label>
    <input type="password" id="password" name="password" required>

    <label for="address">Address</label>
    <textarea id="address" name="address" rows="3"></textarea>

    <label for="gender">Gender</label>
    <select id="gender" name="gender">
      <option value="">--Select--</option>
      <option value="Male">Male</option>
      <option value="Female">Female</option>
      <option value="Other">Other</option>
    </select>
  

    <label for="salary">Salary *</label>
    <input type="number" id="salary" name="salary" required>

    <label for="shift">Shift *</label>
<select id="shift" name="shift" required>
  <option value="">--Select Shift--</option>
  <option value="Morning">Morning</option>
  <option value="Afternoon">Afternoon</option>
  <option value="Night">Night</option>
</select>
    

    <label for="hire_date">Hire Date *</label>
    <input type="date" id="hire_date" name="hire_date" required>

   <label for="job_title">Job Title *</label>
<select id="job_title" name="job_title" required>
    <option value="">-- Select Chef Title --</option>
    <option value="Executive Chef">Executive Chef</option>
    <option value="Sous Chef">Sous Chef</option>
    <option value="Line Cook">Line Cook</option>
    <option value="Prep Cook">Prep Cook</option>
    <option value="Pastry Chef">Pastry Chef</option>
</select>
   

    <input type="submit" value="Register">
  </form>
</div>

</body>
</html>
