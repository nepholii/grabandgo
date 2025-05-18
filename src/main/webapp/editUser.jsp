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
    <style>
        :root {
            --primary: #E2725B;        /* Warm Terracotta */
            --secondary: #F5F5DC;      /* Creamy Beige */
            --accent1: #A0522D;        /* Toasted Brown */
            --accent2: #FFDAB9;        /* Soft Peach */
            --bg-dark: #FFF5E9;        /* Light cream background variant */
        }

        body {
            background-color: var(--secondary);
            color: var(--accent1);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 30px 25px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(160, 82, 45, 0.25);
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: var(--primary);
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 30px;
            letter-spacing: 1.1px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            font-weight: 600;
            color: var(--accent1);
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            padding: 10px 12px;
            margin-top: 8px;
            border-radius: 8px;
            border: 2px solid var(--accent2);
            font-size: 1rem;
            color: var(--accent1);
            background-color: var(--bg-dark);
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
            outline: none;
            border-color: var(--primary);
            background-color: #fff;
            color: var(--accent1);
        }

        input[readonly] {
            background-color: var(--accent2);
            color: var(--primary);
            cursor: not-allowed;
            border-color: var(--accent1);
        }

        button {
            margin-top: 30px;
            padding: 12px 0;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 700;
            font-size: 1.1rem;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(226, 114, 91, 0.6);
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: var(--accent1);
            box-shadow: 0 8px 20px rgba(160, 82, 45, 0.8);
        }

        /* Responsive */
        @media screen and (max-width: 480px) {
            .container {
                width: 95%;
                padding: 20px 15px;
            }

            h2 {
                font-size: 1.8rem;
            }
        }
    </style>
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
        <input type="text" name="address" value="<%= user.getAddress() %>">

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
