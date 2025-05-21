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
    <link rel="stylesheet" type="text/css" href="css/delete-user.css">
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
