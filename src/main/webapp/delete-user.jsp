<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ include file="admin-header.jsp" %>

<%
    UserDAO userDAO = new UserDAO();
    List<User> users = userDAO.getUsersByRole("Customer"); 
%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
    <style>
        :root {
            --primary: #E2725B;       /* Warm Terracotta */
            --secondary: #F5F5DC;     /* Creamy Beige */
            --accent1: #A0522D;       /* Toasted Brown */
            --accent2: #FFDAB9;       /* Soft Peach */
            --bg-light: #FFF5E9;      /* Light cream background variant */
            --danger: #D94F4F;        /* Softer red for delete */
            --danger-hover: #B03B3B;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--secondary);
            padding: 40px;
            color: var(--accent1);
            margin: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 16px rgba(160, 82, 45, 0.15);
            color: var(--accent1);
        }

        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid var(--accent2);
        }

        th {
            background-color: var(--primary);
            color: white;
            font-weight: 700;
            letter-spacing: 0.05em;
        }

        tr:hover {
            background-color: var(--bg-light);
        }

        .delete-button {
            background-color: var(--danger);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-weight: 700;
            transition: background-color 0.3s ease;
        }

        .delete-button:hover {
            background-color: var(--danger-hover);
        }

        h2 {
            text-align: center;
            color: var(--primary);
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 2rem;
            letter-spacing: 0.08em;
        }

        /* Responsive */
        @media screen and (max-width: 600px) {
            table, th, td {
                font-size: 0.9rem;
            }
            h2 {
                font-size: 1.6rem;
            }
        }
    </style>
</head>
<body>

<h2>Delete Users</h2>

<table>
    <thead>
        <tr>
            <th>User ID</th>
            <th>Username</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <%
        if (users != null && !users.isEmpty()) {
            for (User user : users) {
    %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getUsername() %></td>
            <td><%= user.getFirstName() %></td>
            <td><%= user.getLastName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getRole() %></td>
            <td>
                <form action="DeleteUserServlet" method="post" onsubmit="return confirm('Are you sure you want to delete user <%= user.getUsername() %>?');">
                    <input type="hidden" name="userId" value="<%= user.getId() %>" />
                    <button type="submit" class="delete-button">Delete</button>
                </form>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="7" style="text-align:center; color: var(--accent1); font-weight: 600;">No users found.</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
