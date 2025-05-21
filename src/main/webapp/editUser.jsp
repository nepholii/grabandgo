<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.User" %>
<%@ page import="DAO.UserDAO" %>

<%
    int userId = Integer.parseInt(request.getParameter("userId"));
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId);  // Must return only customers

    if (user == null || !"Customer".equals(user.getRole())) {
%>
    <p style="color: #E2725B; text-align: center; font-weight: 700; font-size: 1.2rem;">Customer not found.</p>
<%
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
   <link rel="stylesheet" type="text/css" href="css/editUser.css">
</head>
<body>

<jsp:include page="admin-header.jsp" />
<br>
<br>

<div class="container">
    <h2>Edit Customer</h2>
    <form action="UpdateUserServlet" method="post">
        <!-- Show userId but readonly -->
        <label>User ID</label>
        <input type="text" value="<%= user.getId() %>" readonly>
        <input type="hidden" name="userId" value="<%= user.getId() %>">

        <label>First Name</label>
        <input type="text" name="firstName" value="<%= user.getFirstName() %>" required>

        <label>Last Name</label>
        <input type="text" name="lastName" value="<%= user.getLastName() %>" required>

        <label>Username</label>
        <input type="text" name="username" value="<%= user.getUsername() %>" required>

        <label>Phone</label>
        <input type="text" name="phone" value="<%= user.getPhone() %>">

        <label>Email</label>
        <input type="email" name="email" value="<%= user.getEmail() %>">

        <label>Gender</label>
        <select name="gender">
            <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
            <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
            <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
        </select>

       <label>Address</label>
<select name="address" id="address" required>
    <option value="" disabled <%= user.getAddress() == null || user.getAddress().isEmpty() ? "selected" : "" %>>Select Address</option>
    <option value="Kathmandu" <%= "Kathmandu".equals(user.getAddress()) ? "selected" : "" %>>Kathmandu</option>
    <option value="Lalitpur" <%= "Lalitpur".equals(user.getAddress()) ? "selected" : "" %>>Lalitpur</option>
    <option value="Bhaktapur" <%= "Bhaktapur".equals(user.getAddress()) ? "selected" : "" %>>Bhaktapur</option>
    <option value="Pokhara" <%= "Pokhara".equals(user.getAddress()) ? "selected" : "" %>>Pokhara</option>
    <option value="Biratnagar" <%= "Biratnagar".equals(user.getAddress()) ? "selected" : "" %>>Biratnagar</option>
    <option value="Others" <%= "Others".equals(user.getAddress()) ? "selected" : "" %>>Others</option>
</select>
       

        <label>Status</label>
        <select name="status">
            <option value="Active" <%= "Active".equals(user.getStatus()) ? "selected" : "" %>>Active</option>
            <option value="Inactive" <%= "Inactive".equals(user.getStatus()) ? "selected" : "" %>>Inactive</option>
        </select>

        <label>Role</label>
        <input type="text" name="role" value="<%= user.getRole() %>" required readonly style="background-color: var(--accent2); color: var(--primary); cursor: not-allowed;">

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter new password to change">

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
