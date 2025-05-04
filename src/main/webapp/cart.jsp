<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart – Grab & Go</title>
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

        .cart-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        h1 {
            font-size: 42px;
            text-align: center;
            margin: 40px 0 30px;
            color: #FFCC00;
        }

        .message {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            background-color: rgba(76, 175, 80, 0.1);
            border-radius: 5px;
        }

        .error-message {
            color: #FF3C00;
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            background-color: rgba(255, 60, 0, 0.1);
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 30px 0;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        th {
            background-color: #FF3C00;
            color: white;
        }

        .quantity-control-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-adjuster {
            display: flex;
            align-items: center;
        }

        .quantity-btn {
            background-color: #333;
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
            margin: 0 10px;
            height: 30px;
            border: 1px solid #444;
            background-color: #2a2a2a;
            color: white;
        }

        .update-btn {
            background-color: #FFA500;
            color: white;
            border: none;
            padding: 5px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s ease;
            height: 30px;
            white-space: nowrap;
        }

        .update-btn:hover {
            background-color: #FF8C00;
        }

        .remove-btn {
            background-color: #ff3333;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .remove-btn:hover {
            background-color: #ff0000;
        }

        .cart-total {
            text-align: right;
            margin-top: 30px;
            padding: 20px;
            background-color: #2a2a2a;
            border-radius: 8px;
        }

        .total {
            font-weight: bold;
            font-size: 24px;
            color: #FFCC00;
            margin-bottom: 20px;
        }

        .confirm-order-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 6px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .confirm-order-btn:hover {
            background-color: #45a049;
        }

        .continue-shopping-link {
            display: inline-block;
            padding: 12px 30px;
            background-color: #FF3C00;
            color: white;
            border-radius: 6px;
            font-weight: bold;
            font-size: 16px;
            text-decoration: none;
            transition: background 0.3s ease;
            margin-left: 15px;
        }

        .continue-shopping-link:hover {
            background-color: #FFA500;
        }

        .action-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
        }

        .empty-cart {
            text-align: center;
            padding: 50px;
            font-size: 18px;
            color: #ccc;
        }

        @media screen and (max-width: 768px) {
            table {
                font-size: 14px;
            }
            
            th, td {
                padding: 10px;
            }
            
            .quantity-control-group {
                flex-wrap: wrap;
            }
            
            .update-btn {
                margin-top: 5px;
            }
            
            .continue-shopping-link {
                margin-left: 0;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>

	<div class="cart-container">
	    <h1>Your Cart</h1>
	    
	    <c:if test="${not empty message}">
	        <div class="message">${message}</div>
	    </c:if>
	    
	    <c:if test="${not empty errorMessage}">
	        <div class="error-message">${errorMessage}</div>
	    </c:if>
	    
	    <c:choose>
	        <c:when test="${not empty cart and not empty cart.items}">
	            <table>
	                <thead>
	                    <tr>
	                        <th>Food Item</th>
	                        <th>Price</th>
	                        <th>Quantity</th>
	                        <th>Subtotal</th>
	                        <th>Action</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach items="${cart.items.values()}" var="item">
	                        <tr>
	                            <td>${item.foodName}</td>
	                            <td>$${String.format("%.2f", item.price)}</td>
	                            <td>
	                                <form action="cart" method="post" class="quantity-form">
	                                    <input type="hidden" name="action" value="update">
	                                    <input type="hidden" name="foodId" value="${item.foodId}">
	                                    <div class="quantity-control-group">
	                                        <div class="quantity-adjuster">
	                                            <button type="button" class="quantity-btn minus">-</button>
	                                            <input type="number" name="quantity" value="${item.quantity}" 
	                                                   min="1" class="quantity-input">
	                                            <button type="button" class="quantity-btn plus">+</button>
	                                        </div>
	                                        <button type="submit" class="update-btn">Update</button>
	                                    </div>
	                                </form>
	                            </td>
	                            <td>$${String.format("%.2f", item.getSubtotal())}</td>
	                            <td>
	                                <form action="cart" method="post">
	                                    <input type="hidden" name="action" value="remove">
	                                    <input type="hidden" name="foodId" value="${item.foodId}">
	                                    <button type="submit" class="remove-btn">Remove</button>
	                                </form>
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	            
	            <div class="cart-total">
	                <p class="total">Total: $${String.format("%.2f", cart.total)}</p>
	                
	                <div class="action-buttons">
	                    <form action="checkout" method="post">
						    <button type="submit" class="confirm-order-btn">Confirm Order</button>
						</form>
	                    <a href="MenuServlet" class="continue-shopping-link">Continue Shopping</a>
	                </div>
	            </div>
	        </c:when>
	        <c:otherwise>
	            <div class="empty-cart">
	                <p>Your cart is empty</p>
	                <a href="MenuServlet" class="continue-shopping-link">Browse our menu</a>
	            </div>
	        </c:otherwise>
	    </c:choose>
	</div>
	
	<script>
	    // Quantity adjustment with auto-update
	    document.querySelectorAll('.quantity-btn').forEach(btn => {
	        btn.addEventListener('click', function() {
	            const form = this.closest('form');
	            const input = form.querySelector('.quantity-input');
	            let value = parseInt(input.value);
	            const min = parseInt(input.min);
	            
	            if (this.classList.contains('plus')) {
	                input.value = value + 1;
	            } else {
	                input.value = value > min ? value - 1 : min;
	            }
	            form.requestSubmit();
	        });
	    });
	</script>

</body>
</html>