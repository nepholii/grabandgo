<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Staff" %>
<%@ page import="DAO.StaffDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    String staffIdParam = request.getParameter("staffId");
    Staff staff = null;

    if (staffIdParam != null && !staffIdParam.isEmpty()) {
        try {
            int staffId = Integer.parseInt(staffIdParam);
            StaffDAO staffDAO = new StaffDAO();
            staff = staffDAO.getStaffById(staffId);
            if (staff != null) {
                request.setAttribute("staff", staff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    String formattedDateTime = "";
    if (staff != null && staff.getHireDate() != null) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        formattedDateTime = sdf.format(staff.getHireDate());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Staff</title>
  	<link rel="stylesheet" type="text/css" href="css/editStaff.css">
</head>
<body>

<jsp:include page="admin-header.jsp" />
<br><br>

<div class="container">
    <h2>Edit Staff</h2>

    <% if (staff == null) { %>
        <p class="error">Invalid or missing staff ID.</p>
    <% } else { %>
        <form action="UpdateStaffServlet" method="post">
            <input type="hidden" name="staffId" value="<%= staff.getStaffId() %>">

            <label>First Name</label>
            <input type="text" name="firstName" value="<%= staff.getFirstName() %>" required>

            <label>Last Name</label>
            <input type="text" name="lastName" value="<%= staff.getLastName() %>" required>

            <label>Username</label>
            <input type="text" name="username" value="<%= staff.getUsername() %>" required>

            <label>Phone</label>
            <input type="text" name="phone" value="<%= staff.getPhone() %>" required>

            <label>Email</label>
            <input type="email" name="email" value="<%= staff.getEmail() %>" required>

            <label>Gender</label>
            <select name="gender" required>
                <option value="Male" <%= "Male".equals(staff.getGender()) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(staff.getGender()) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(staff.getGender()) ? "selected" : "" %>>Other</option>
            </select>

            <label>Salary</label>
            <input type="number" name="salary" step="0.01" value="<%= staff.getSalary() %>" required>

              <label for="shift">Shift *</label>
<select id="shift" name="shift" required>
  <option value="">--Select Shift--</option>
  <option value="Morning">Morning</option>
  <option value="Afternoon">Afternoon</option>
  <option value="Night">Night</option>
</select>
    
            <label>Hire Date</label>
            <input type="datetime-local" name="hireDate" value="<%= formattedDateTime %>" required>

           <label for="job_title">Job Title *</label>
<select id="jobTitle" name="jobTitle" required>
    <option value="">-- Select Chef Title --</option>
    <option value="Executive Chef">Executive Chef</option>
    <option value="Sous Chef">Sous Chef</option>
    <option value="Line Cook">Line Cook</option>
    <option value="Prep Cook">Prep Cook</option>
    <option value="Pastry Chef">Pastry Chef</option>
</select>
           

            <button type="submit">Update Staff</button>
        </form>
    <% } %>
</div>

</body>
</html>
