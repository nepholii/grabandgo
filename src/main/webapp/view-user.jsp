<%@ page import="java.util.*, DAO.UserDAO, Model.User" %>
<%@ include file="admin-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
    <link rel="stylesheet" type="text/css" href="css/view-user.css">
</head>
<body>

<h2>Customer Users</h2>

<%
    try {
        UserDAO dao = new UserDAO();
        List<User> customers = dao.getUsersByRole("Customer");
%>

<p class="total-count">Total Customers: <%= customers.size() %></p>

<table>
    <thead>
        <tr>
            <th>User ID</th>
            <th>Name</th>
            <th>Username</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Gender</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
    <%
        for (User user : customers) {
            String statusClass = "status-" + (user.getStatus() != null && user.getStatus().equalsIgnoreCase("active") ? "active" : "inactive");
    %>
        <tr>
            <td data-label="User ID"><%= user.getId() %></td>
            <td data-label="Name"><%= user.getFirstName() %> <%= user.getLastName() %></td>
            <td data-label="Username"><%= user.getUsername() %></td>
            <td data-label="Phone"><%= user.getPhone() %></td>
            <td data-label="Email"><%= user.getEmail() %></td>
            <td data-label="Address"><%= user.getAddress() %></td>
            <td data-label="Gender"><%= user.getGender() %></td>
            <td data-label="Status" class="<%= statusClass %>"><%= user.getStatus() %></td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

<%
    } catch (Exception e) {
        out.println("<p style='color:#A0522D; text-align:center; font-weight:bold;'>Error loading users: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }
%>

</body>
</html>
