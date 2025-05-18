<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="admin-header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #F5F5DC; /* Creamy Beige */
            margin: 0;
            padding: 0;
        }
        form {
            max-width: 600px;
            margin: 60px auto;
            background-color: #FFFFFF; /* keep form white for contrast */
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(162, 82, 45, 0.2); /* Toasted Brown shadow */
            transition: box-shadow 0.3s ease;
        }
        form:hover {
            box-shadow: 0 10px 30px rgba(162, 82, 45, 0.35);
        }
        h2 {
            color: #E2725B; /* Warm Terracotta */
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 28px;
        }
        label {
            color: #A0522D; /* Toasted Brown */
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
        }
        input, select {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1.5px solid #FFDAB9; /* Soft Peach border */
            border-radius: 10px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input:focus, select:focus {
            border-color: #E2725B; /* Warm Terracotta on focus */
            outline: none;
            box-shadow: 0 0 8px #E2725B;
        }
        button {
            width: 100%;
            background-color: #E2725B; /* Warm Terracotta */
            color: white;
            padding: 14px;
            font-size: 18px;
            font-weight: 700;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #A0522D; /* Toasted Brown on hover */
        }
        .message {
            max-width: 600px;
            margin: 30px auto 0 auto;
            padding: 18px 25px;
            border-radius: 12px;
            text-align: center;
            font-weight: 700;
            font-size: 18px;
            color: #A0522D; /* Toasted Brown */
        }
        .success {
            background-color: #FFDAB9; /* Soft Peach */
            border: 1px solid #E2725B; /* Warm Terracotta */
        }
        .error {
            background-color: #FFE4C4; /* a lighter peach-beige for error */
            border: 1px solid #A0522D; /* Toasted Brown */
            color: #A0522D;
        }
    </style>
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



<form action="CreateUserServlet" method="post">
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
    <input type="text" id="address" name="address" required>

    <label for="gender">Gender</label>
    <select id="gender" name="gender" required>
        <option value="">-- Select Gender --</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
    </select>

    <button type="submit">Create User</button>
</form>

</body>
</html>
