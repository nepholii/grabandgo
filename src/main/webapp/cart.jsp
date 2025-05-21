<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart – Grab & Go</title>
    <link rel="stylesheet" type="text/css" href="css/cart.css">
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