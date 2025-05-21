<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Staff Registration</title>
  <link rel="stylesheet" type="text/css" href="css/create-staff.css">
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
