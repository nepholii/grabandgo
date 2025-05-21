<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Model.OrderModel" %>
<%@ page import="java.util.List" %>


<%
    String loggedInStaff = (String) session.getAttribute("username");
    List<OrderModel> orders = (List<OrderModel>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Orders</title>
    <link rel="stylesheet" href="css/manage-order.css">
</head>
<body>

<header class="navbar">
    <a href="staff-dashboard.jsp" class="logo">Grab & Go</a>
    <nav>
        <ul class="nav-links">
            <li><a href="staff-dashboard.jsp">Dashboard</a></li>
            <li><a href="manage-orders">Orders</a></li>
            <li style="margin-left: 60px;"><a href="LogoutServlet">Logout</a></li>

        </ul>
    </nav>
   <div class="nav-right">
    <div id="profileContainer" class="profile-info">
        <img src="images/profile.png" alt="Staff" class="profile-img" id="profileImg">
        <% if (loggedInStaff != null) { %>
            <span class="profile-name"><%= loggedInStaff %></span>
        <% } %>
       
    </div>
</div>
        
    
</header>

<div class="dashboard-container">
    <h2>Manage Orders</h2>
    <% if (orders == null || orders.isEmpty()) { %>
        <div class="no-orders">
            <p>No orders found.</p>
        </div>
    <% } else { %>
        <table class="order-table">
            <thead>
                <tr>
                    <th>Customer Name</th>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Price</th>
                    <th>Payment Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (OrderModel order : orders) { %>
                <tr>
                    <td><%= order.getCustomerName() %></td>
                    <td><%= order.getOrderId() %></td>
                    <td><%= order.getOrderDate() %></td>
                    <td>
                        <select name="orderStatus" form="form-<%= order.getOrderId() %>">
                            <option value="Pending" <%= "Pending".equals(order.getOrderStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="Processing" <%= "Processing".equals(order.getOrderStatus()) ? "selected" : "" %>>Processing</option>
                            <option value="Ready" <%= "Ready".equals(order.getOrderStatus()) ? "selected" : "" %>>Ready</option>
                            <option value="Completed" <%= "Completed".equals(order.getOrderStatus()) ? "selected" : "" %>>Completed</option>
                        </select>
                    </td>
                    <td>
                        <input type="number" name="orderPrice" value="<%= order.getOrderPrice() %>" step="0.01" min="0" form="form-<%= order.getOrderId() %>">
                    </td>
                    <td>
                        <select name="paymentStatus" form="form-<%= order.getOrderId() %>">
                            <option value="Pending" <%= "Pending".equals(order.getPaymentStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="Paid" <%= "Paid".equals(order.getPaymentStatus()) ? "selected" : "" %>>Paid</option>
    
                            <option value="Refunded" <%= "Refunded".equals(order.getPaymentStatus()) ? "selected" : "" %>>Refunded</option>
                        </select>
                    </td>
                    <td>
                        <form id="form-<%= order.getOrderId() %>" action="manage-orders" method="POST">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                            <button type="submit">Update</button>
                            <input type="hidden" name="orderDate" value="<%= order.getOrderDate() %>">
                           
                        </form>

                        <form action="manage-orders" method="POST" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
</div>

</body>
</html>
