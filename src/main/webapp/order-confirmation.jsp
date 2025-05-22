<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation – Grab & Go</title>
    <link rel="stylesheet" type="text/css" href="css/order-confirmation.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="confirmation-container">
        <div class="confirmation-header">
            <i class="fas fa-check-circle success-icon"></i>
            <h1>Order Confirmed!</h1>
            <p class="confirmation-subtext">Thank you for your order</p>
        </div>
        
        <div class="order-summary-card">
            <div class="order-details">
                <div class="detail-row">
                    <span class="detail-label">Order Number:</span>
                    <span class="detail-value">#${order.orderId}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Status:</span>
                    <span class="detail-value status-badge ${order.orderStatus.toLowerCase()}">
                        ${order.orderStatus}
                    </span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Payment Method:</span>
                    <span class="detail-value">Cash on Delivery</span>
                </div>
                <div class="detail-row highlight">
                    <span class="detail-label">Pickup Time:</span>
                    <span class="detail-value">
                        <fmt:formatDate value="${order.pickupTime}" pattern="hh:mm a" />
                        <span class="time-remaining">(<span id="timeRemaining"></span>)</span>
                    </span>
                </div>
            </div>
        </div>

        <div class="order-items-card">
            <h2 class="card-title">Your Order</h2>
            <div class="items-table-container">
                <table class="order-items">
                    <thead>
                        <tr>
                            <th class="item-name">Item</th>
                            <th class="item-price">Price</th>
                            <th class="item-qty">Qty</th>
                            <th class="item-subtotal">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty order and not empty order.items}">
                                <c:forEach items="${order.items}" var="item">
                                    <tr>
                                        <td class="item-name">${item.foodName}</td>
                                        <td class="item-price">$${String.format("%.2f", item.price)}</td>
                                        <td class="item-qty">${item.quantity}</td>
                                        <td class="item-subtotal">$${String.format("%.2f", item.price * item.quantity)}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" class="empty-cart-message">
                                        <i class="fas fa-shopping-cart"></i> No items found in this order
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            
            <div class="order-total-section">
                <div class="total-row">
                    <span class="total-label">Subtotal:</span>
                    <span class="total-value">$${String.format("%.2f", order.orderPrice)}</span>
                </div>
                <div class="total-row">
                    <span class="total-label">Tax:</span>
                    <span class="total-value">$0.00</span>
                </div>
                <div class="total-row grand-total">
                    <span class="total-label">Total:</span>
                    <span class="total-value">$${String.format("%.2f", order.orderPrice)}</span>
                </div>
            </div>
        </div>

        <div class="customer-notes">
            <div class="note-box">
                <i class="fas fa-info-circle"></i>
                <p>Your food will be ready for pickup at the estimated time shown above. 
                Please bring your order number (#${order.orderId}) when you arrive.</p>
            </div>
        </div>

        <div class="action-buttons">
            <a href="MenuServlet" class="btn btn-primary">
                <i class="fas fa-utensils"></i> Order Again
            </a>
            <a href="OrderHistoryServlet" class="btn btn-secondary">
                <i class="fas fa-history"></i> View Order History
            </a>
        </div>
    </div>

    <script>
        // Dynamic time remaining calculation
        function updateTimeRemaining() {
            const pickupTime = new Date('<fmt:formatDate value="${order.pickupTime}" pattern="yyyy-MM-dd'T'HH:mm:ss" />');
            const now = new Date();
            const diffMs = pickupTime - now;
            const diffMins = Math.round(diffMs / 60000);
            
            let timeText;
            if (diffMins <= 0) {
                timeText = 'Ready for pickup!';
            } else if (diffMins < 60) {
                timeText = `About \${diffMins} minutes`;
            } else {
                const hours = Math.floor(diffMins / 60);
                const mins = diffMins % 60;
                timeText = `About \${hours} hour\${hours > 1 ? 's' : ''} \${mins > 0 ? 'and ' + mins + ' minutes' : ''}`;
            }
            
            document.getElementById('timeRemaining').textContent = timeText;
            
            // Update status badge if time has arrived
            if (diffMins <= 0) {
                const statusBadge = document.querySelector('.status-badge');
                if (statusBadge && !statusBadge.classList.contains('ready')) {
                    statusBadge.classList.add('ready');
                    statusBadge.textContent = 'Ready for Pickup';
                }
            }
        }
        
        // Initialize and update every minute
        document.addEventListener('DOMContentLoaded', function() {
            updateTimeRemaining();
            setInterval(updateTimeRemaining, 60000);
            
            // Add animation to success icon
            const successIcon = document.querySelector('.success-icon');
            if (successIcon) {
                successIcon.style.transform = 'scale(0)';
                setTimeout(() => {
                    successIcon.style.transition = 'transform 0.5s ease-out';
                    successIcon.style.transform = 'scale(1)';
                }, 100);
            }
        });
    </script>
    
    <%@ include file="footer.jsp" %>
</body>
</html>