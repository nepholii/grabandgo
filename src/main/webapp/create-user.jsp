<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="admin-header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
    <link rel="stylesheet" type="text/css" href="css/create-user.css">
</head>
<body>
<br>
<br>
<br>

<c:if test="${not empty message}">
    <div class="message ${messageType == 'success' ? 'success' : 'error'}">
        ${message}
    </div>
</c:if>

<form action="CreateUserServlet" method="post" enctype="multipart/form-data">

    <h2>Create New User</h2>

    <label for="first_name">First Name</label>
    <input type="text" id="first_name" name="first_name" required>

    <label for="last_name">Last Name</label>
    <input type="text" id="last_name" name="last_name" required>

    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>

    <label for="phone">Phone</label>
    <input type="text" id="phone" name="phone" required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>

    <label for="address">Address</label>
    <select name="address" id="address" required>
        <option value="" disabled selected>Select Address</option>
        <option value="Kathmandu">Kathmandu</option>
        <option value="Lalitpur">Lalitpur</option>
        <option value="Bhaktapur">Bhaktapur</option>
        <option value="Pokhara">Pokhara</option>
        <option value="Biratnagar">Biratnagar</option>
        <option value="Others">Others</option>
    </select>

    <label for="gender">Gender</label>
    <select id="gender" name="gender" required>
        <option value="">-- Select Gender --</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
    </select>

   <label for="image">Image</label>
<input type="file" name="image" id="image" accept="image/*" required>
   

    <button type="submit">Create User</button>
</form>

</body>
</html>
