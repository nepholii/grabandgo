<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order History – Grab & Go</title>
    <link rel="stylesheet" type="text/css" href="css/orderHistory.css">
</head>
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