<%@ page import="java.util.*, DAO.UserDAO, Model.User" %>
<%@ include file="admin-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #F5F5DC; /* Creamy Beige */
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 40px;
            color: #E2725B; /* Warm Terracotta */
            font-weight: 700;
            font-size: 32px;
            letter-spacing: 1.2px;
        }

        p.total-count {
            text-align: center;
            font-size: 18px;
            font-weight: 600;
            color: #A0522D; /* Toasted Brown */
            margin-top: 10px;
            margin-bottom: 30px;
        }

        table {
            margin: 0 auto 60px auto;
            border-collapse: separate;
            border-spacing: 0;
            width: 90%;
            background-color: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(160, 82, 45, 0.2); /* Toasted Brown shadow */
        }

        thead tr {
            background-color: #E2725B; /* Warm Terracotta */
            color: white;
            font-weight: 700;
            font-size: 16px;
            letter-spacing: 0.8px;
        }

        th, td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #FFDAB9; /* Soft Peach */
        }

        tbody tr {
            transition: background-color 0.3s ease;
            cursor: default;
        }

        tbody tr:nth-child(even) {
            background-color: #FFF1E6; /* Very light peach */
        }

        tbody tr:hover {
            background-color: #FFDAB9; /* Soft Peach */
        }

        /* Status styling: you can improve by adding colors based on status */
        td.status-active {
            color: #4CAF50; /* Green for active */
            font-weight: 600;
        }

        td.status-inactive {
            color: #A0522D; /* Toasted Brown for inactive */
            font-weight: 600;
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }
            thead tr {
                display: none;
            }
            tbody tr {
                margin-bottom: 20px;
                border-radius: 12px;
                box-shadow: 0 4px 15px rgba(160, 82, 45, 0.15);
                padding: 15px;
                background-color: white !important;
            }
            tbody td {
                text-align: right;
                padding-left: 50%;
                position: relative;
                border-bottom: 1px solid #FFDAB9;
            }
            tbody td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                width: 45%;
                padding-left: 10px;
                font-weight: 700;
                text-align: left;
                color: #A0522D;
            }
        }
    </style>
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
