<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Our Menu – Grab & Go</title>
    <link rel="stylesheet" href="css/menu.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/menu.css">
</head>
<body>

<section class="menu-section">
    <h2 class="section-title">Our Full Menu</h2>
    
    <c:if test="${not empty message}">
        <div class="message" style="color: #4CAF50; margin-bottom: 20px;">${message}</div>
    </c:if>
    
    <c:if test="${not empty errorMessage}">
        <div class="error-message" style="color: #FF3C00; margin-bottom: 20px;">${errorMessage}</div>
    </c:if>
    
    <div class="menu-grid">
    <c:forEach items="${foodItems}" var="food">
        <a href="FoodDetailsServlet?foodId=${food.foodId}" style="text-decoration: none;">
            <div class="menu-item">
                <img src="${not empty food.imagePath ? food.imagePath : 'images/default-food.jpg'}" 
                     alt="${food.foodName}" loading="lazy">
                <h3>${food.foodName}</h3>
                <p>${not empty food.foodDescription ? food.foodDescription : 'Delicious food item'}</p>
                <span class="price">$${String.format("%.2f", food.foodPrice)}</span>
                <c:if test="${food.quantity == 0}">
                    <div class="out-of-stock">Out of Stock</div>
                </c:if>
            </div>
        </a>
    </c:forEach>
</div>
</section>



<script>
    document.querySelectorAll('.quantity-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const input = this.parentNode.querySelector('.quantity-input');
            let value = parseInt(input.value);
            const max = parseInt(input.max);
            const min = parseInt(input.min);
            
            if (this.classList.contains('plus')) {
                input.value = value < max ? value + 1 : max;
            } else {
                input.value = value > min ? value - 1 : min;
            }
        });
    });
</script>
<%@ include file="footer.jsp" %>
</body>
</html>