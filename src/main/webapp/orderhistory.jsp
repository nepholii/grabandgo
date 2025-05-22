<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order History – Grab & Go</title>
</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', sans-serif;
    background-color: #121212;
    color: #fff;
}

.order-history-container {
    max-width: 900px;
    margin: 40px auto;
    padding: 40px;
    background-color: #2a2a2a;
    border-radius: 16px;
    box-shadow: 0 0 20px rgba(255, 204, 0, 0.1);
}

.order-history-container h1 {
    color: #FFCC00;
    font-size: 36px;
    text-align: center;
    margin-bottom: 30px;
}

.order-history-container h2 {
    color: #FFCC00;
    margin-bottom: 20px;
    font-size: 24px;
    padding-bottom: 10px;
    border-bottom: 1px solid #FF3C00;
}

.orders-section {
    margin-bottom: 40px;
}

.order-card {
    border: 1px solid #444;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    background-color: #333;
}

.order-card.ongoing {
    border-left: 5px solid #FFA500;
}

.order-card.completed {
    border-left: 5px solid #4CAF50;
}

.order-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 1px solid #444;
}

.order-id {
    font-weight: bold;
    color: #FFCC00;
}

.order-status {
    font-weight: bold;
    color: #FF3C00;
    text-transform: capitalize;
}

.order-meta {
    display: flex;
    gap: 20px;
    margin-bottom: 15px;
}

.meta-label {
    font-weight: bold;
    color: #FFCC00;
    margin-right: 5px;
}

.meta-value {
    color: #ddd;
}

.order-items h4 {
    color: #FFCC00;
    margin-bottom: 10px;
}

.items-table {
    width: 100%;
    border-collapse: collapse;
}

.items-table th {
    background-color: #FF3C00;
    color: white;
    padding: 8px;
    text-align: left;
}

.items-table td {
    padding: 8px;
    border-bottom: 1px solid #444;
}

.item-name {
    width: 50%;
}

.item-price, .item-quantity, .item-subtotal {
    text-align: right;
    width: 15%;
}

.item-subtotal {
    font-weight: bold;
}

.order-actions {
    margin-top: 15px;
    text-align: right;
}

.reorder-btn {
    display: inline-block;
    padding: 8px 20px;
    background-color: #FF3C00;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s;
    font-weight: bold;
}

.reorder-btn:hover {
    background-color: #FFA500;
}

.no-orders {
    text-align: center;
    padding: 30px;
    color: #aaa;
    font-size: 18px;
    background-color: #333;
    border-radius: 8px;
}

@media screen and (max-width: 768px) {
    .order-history-container {
        padding: 20px;
        margin: 20px;
    }
    
    .order-meta {
        flex-direction: column;
        gap: 8px;
    }
    
    .items-table {
        display: block;
        overflow-x: auto;
    }
    
    .order-header {
        flex-direction: column;
        gap: 8px;
    }
}
</style>
<body>
    <div class="order-history-container">
        <h1>Your Orders</h1>
        
        <!-- Ongoing Orders Section -->
        <c:if test="${not empty ongoingOrders}">
            <h2>Ongoing Orders</h2>
            <div class="orders-section">
                <c:forEach items="${ongoingOrders}" var="order">
                    <div class="order-card ongoing">
                        <div class="order-header">
                            <span class="order-id">Order #${order.orderId}</span>
                            <span class="order-status">${order.orderStatus}</span>
                        </div>
                        
                        <div class="order-meta">
                            <div class="payment-info">
                                <span class="meta-label">Payment:</span>
                                <span class="meta-value">${order.paymentStatus}</span>
                            </div>
                            <div class="total-info">
                                <span class="meta-label">Total:</span>
                                <span class="meta-value">$<fmt:formatNumber value="${order.orderPrice}" pattern="0.00"/></span>
                            </div>
                        </div>
                        
                        <div class="order-items">
                            <h4>Items:</h4>
                            <table class="items-table">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Price</th>
                                        <th>Qty</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order.items}" var="item">
                                    <tr class="item-row">
                                        <td class="item-name">${item.foodName}</td>
                                        <td class="item-price">$<fmt:formatNumber value="${item.price}" pattern="0.00"/></td>
                                        <td class="item-quantity">${item.quantity}</td>
                                        <td class="item-subtotal">$<fmt:formatNumber value="${item.price * item.quantity}" pattern="0.00"/></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        
        <!-- Completed Orders Section -->
        <h2>Order History</h2>
        <div class="orders-section">
            <c:choose>
                <c:when test="${not empty completedOrders}">
                    <c:forEach items="${completedOrders}" var="order">
                        <div class="order-card completed">
                            <div class="order-header">
                                <span class="order-id">Order #${order.orderId}</span>
                                <span class="order-status">${order.orderStatus}</span>
                            </div>
                            
                            <div class="order-meta">
                                <div class="payment-info">
                                    <span class="meta-label">Payment:</span>
                                    <span class="meta-value">${order.paymentStatus}</span>
                                </div>
                                <div class="total-info">
                                    <span class="meta-label">Total:</span>
                                    <span class="meta-value">$<fmt:formatNumber value="${order.orderPrice}" pattern="0.00"/></span>
                                </div>
                            </div>
                            
                            <div class="order-items">
                                <h4>Items:</h4>
                                <table class="items-table">
                                    <thead>
                                        <tr>
                                            <th>Item</th>
                                            <th>Price</th>
                                            <th>Qty</th>
                                            <th>Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${order.items}" var="item">
                                        <tr class="item-row">
                                            <td class="item-name">${item.foodName}</td>
                                            <td class="item-price">$<fmt:formatNumber value="${item.price}" pattern="0.00"/></td>
                                            <td class="item-quantity">${item.quantity}</td>
                                            <td class="item-subtotal">$<fmt:formatNumber value="${item.price * item.quantity}" pattern="0.00"/></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="order-actions">
                                <a href="ReorderServlet?orderId=${order.orderId}" class="reorder-btn">Reorder</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="no-orders">No orders have been completed yet!</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>