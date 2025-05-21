<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile – Grab & Go</title>
    <link rel="stylesheet" type="text/css" href="css/edit-profile.css">
</head>
<body>

	<div class="edit-container">
	    <h2>Edit Profile</h2>
	    <form action="UpdateCustomerServlet" method="post">
	        <div class="form-group">
	            <label for="first_name">First Name</label>
	            <input type="text" id="first_name" name="first_name" placeholder="Enter first name">
	        </div>
	
	        <div class="form-group">
	            <label for="last_name">Last Name</label>
	            <input type="text" id="last_name" name="last_name" placeholder="Enter last name">
	        </div>
	
	        <div class="form-group">
	            <label for="username">Username</label>
	            <input type="text" id="username" name="username" placeholder="Enter new username">
	        </div>
	
	        <div class="form-group">
	            <label for="phone">Phone</label>
	            <input type="tel" id="phone" name="phone" placeholder="Enter phone number">
	        </div>
	
	        <div class="form-group">
	            <label for="email">Email</label>
	            <input type="email" id="email" name="email" placeholder="Enter email address">
	        </div>
	
	        <div class="form-group">
	            <label for="password">Password</label>
	            <input type="password" id="password" name="password" placeholder="Enter new password">
	        </div>
	
	        <div class="form-group">
	            <label for="address">Address</label>
	            <textarea id="address" name="address" rows="3" placeholder="Enter address"></textarea>
	        </div>
	
	        <div class="form-group">
	            <label for="gender">Gender</label>
	            <select id="gender" name="gender">
	                <option value="" disabled selected>Select gender</option>
	                <option value="Male">Male</option>
	                <option value="Female">Female</option>
	                <option value="Other">Other</option>
	            </select>
	        </div>
	
	        <button type="submit" class="save-btn">Save Changes</button>
	    </form>
	</div>

   <%@ include file="footer.jsp" %>

</body>
</html>
