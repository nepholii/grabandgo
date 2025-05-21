<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="DAO.OrderModelDAO" %>

<%
    String loggedInStaff = (String) session.getAttribute("username");

    // Retrieve counts from the DAO
    int totalOrders = OrderModelDAO.getTotalOrdersCount();
    int preparingOrders = OrderModelDAO.getPreparingOrdersCount();
    int completedOrders = OrderModelDAO.getCompletedOrdersCount();
    int pendingOrders = OrderModelDAO.getPendingOrdersCount();
    int readyOrders = OrderModelDAO.getReadyOrdersCount();

    
%>

<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
    <link rel="stylesheet" href="css/staff-dashboard.css">
     
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
    <h2>Staff Dashboard</h2>

    <!-- Stat Cards -->
    <div class="card-row">
        <div class="card">
            <i class="fas fa-clipboard-list"></i>
            <h3><%= totalOrders %></h3>
            <p>Total Orders</p>
        </div>
        <div class="card">
            <i class="fas fa-hourglass-half"></i>
            <h3><%= preparingOrders %></h3>
            <p>Preparing Orders</p>
        </div>
        <div class="card">
            <i class="fas fa-check-circle"></i>
            <h3><%= completedOrders %></h3>
            <p>Completed Orders</p>
        </div>
        <div class="card">
            <i class="fas fa-clock"></i>
            <h3><%= pendingOrders %></h3>
            <p>Pending Orders</p>
        </div>
        <div class="card">
            <i class="fas fa-check-circle"></i>
            <h3><%= readyOrders %></h3>
            <p>Ready Orders</p>
        </div>
    </div>
    
 </div>

   <!-- Order Status Chart -->
<div class="chart-section">
    <h2>Order Status Distribution</h2>
    <canvas id="orderStatusChart"></canvas>
</div>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('orderStatusChart').getContext('2d');
    const orderStatusChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Preparing Orders', 'Completed Orders', 'Pending Orders', 'Ready Orders'],
            datasets: [{
                label: 'Order Status Distribution',
                data: [<%= preparingOrders %>, <%= completedOrders %>, <%= pendingOrders %>, <%= readyOrders %>],
                backgroundColor: [
                    '#A3D8FF',  // Preparing Orders (Pastel Blue)
                    '#A9E5A1',  // Completed Orders (Pastel Green)
                    '#C7A0FF',  // Pending Orders (Pastel Purple)
                    '#FFB3B3'   // Ready Orders (Pastel Pink)
                ],
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                tooltip: {
                    backgroundColor: '#2c3e50',
                    titleColor: '#ecf0f1',
                    bodyColor: '#ecf0f1',
                    borderColor: '#34495e',
                    borderWidth: 1
                },
                legend: {
                    position: 'top',
                    labels: {
                        font: {
                            size: 14,
                            family: 'Arial, sans-serif',
                            color: '#2C3E50'
                        },
                        boxWidth: 20,
                        padding: 15
                    },
                    onClick: null // Disable default toggle behavior
                }
            }
        }
    });
</script>



</body>
</html>