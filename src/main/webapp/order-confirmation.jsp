<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation – Grab & Go</title>
   	<link rel="stylesheet" type="text/css" href="css/order-confirmation.css">
</head>
<body>
    <div class="confirmation-container">
        <h1 class="confirmation-header">Order Confirmed!</h1>
        
        <div class="order-details">
            <p><strong>Order ID:</strong> #${order.orderId}</p>
            <p><strong>Order Status:</strong> ${order.orderStatus}</p>
            <p><strong>Payment Method:</strong> Cash on Delivery</p>
            <p><strong>Estimated Pickup Time:</strong> 15-20 minutes</p>
        </div>

        <table class="order-items">
            <thead>
                <tr>
                    <th>Food Items</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
			    <c:choose>
			        <c:when test="${not empty order and not empty order.items}">
			            <c:forEach items="${order.items}" var="item">
			                <tr>
			                    <td>${item.foodName}</td>
			                    <td>$${String.format("%.2f", item.price)}</td>
			                    <td>${item.quantity}</td>
			                    <td>$${String.format("%.2f", item.price * item.quantity)}</td>
			                </tr>
			            </c:forEach>
			        </c:when>
			        <c:otherwise>
			            <tr>
			                <td colspan="4" style="text-align: center; color: #FF3C00;">
			                    No items found in this order
			                </td>
			            </tr>
			        </c:otherwise>
			    </c:choose>
			</tbody>
			</table>
			
			<div class="order-total">
			    Total: $<c:out value="${not empty order ? String.format('%.2f', order.orderPrice) : '0.00'}"/>
			</div>
        
        <p style="text-align: center; margin-bottom: 20px; color: #ccc;">
            Thank you for your order! Please proceed to the counter for payment when your order is ready.
        </p>
        
        <div class="action-buttons">
            <a href="MenuServlet" class="btn btn-primary">Order Again</a>
            <a href="order-history.jsp" class="btn btn-secondary">View Order History</a>
        </div>
    </div>
</body>
</html>