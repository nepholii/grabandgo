<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation – Grab & Go</title>
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

        .confirmation-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 40px;
            background-color: #2a2a2a;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(255, 204, 0, 0.1);
        }

        .confirmation-header {
            color: #4CAF50;
            font-size: 36px;
            text-align: center;
            margin-bottom: 30px;
        }

        .order-details {
            background-color: #333;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 30px;
        }

        .order-details p {
            margin: 10px 0;
            font-size: 16px;
        }

        .order-details strong {
            color: #FFCC00;
        }

        .order-items {
            width: 100%;
            border-collapse: collapse;
            margin: 30px 0;
        }

        .order-items th {
            background-color: #FF3C00;
            color: white;
            padding: 15px;
            text-align: left;
            font-size: 16px;
        }

        .order-items td {
            padding: 15px;
            border-bottom: 1px solid #444;
            font-size: 15px;
        }

        .order-total {
            font-size: 24px;
            font-weight: bold;
            color: #FFCC00;
            text-align: right;
            margin: 20px 0 30px;
            padding-top: 20px;
            border-top: 2px solid #FF3C00;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 6px;
            font-weight: bold;
            font-size: 16px;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-primary {
            background-color: #FF3C00;
            color: white;
        }

        .btn-primary:hover {
            background-color: #FFA500;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 60, 0, 0.3);
        }

        .btn-secondary {
            background-color: #333;
            color: white;
            border: 1px solid #FF3C00;
        }

        .btn-secondary:hover {
            background-color: #444;
            transform: translateY(-2px);
        }

        @media screen and (max-width: 768px) {
            .confirmation-container {
                padding: 20px;
                margin: 20px;
            }
            
            .confirmation-header {
                font-size: 28px;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 10px;
            }
            
            .btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
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