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

        .menu-section {
            padding: 60px 40px;
            text-align: center;
        }

        .section-title {
            color: #FFCC00;
            font-size: 36px;
            margin-bottom: 40px;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            justify-items: center;
        }

        .menu-item {
            background-color: #2a2a2a;
            border-radius: 16px;
            padding: 20px;
            transition: transform 0.3s ease;
            box-shadow: 0 0 10px rgba(255, 204, 0, 0.1);
            max-width: 300px;
        }

        .menu-item:hover {
            transform: translateY(-8px);
            background-color: #333;
            box-shadow: 0 10px 20px rgba(255, 204, 0, 0.2);
        }

        .menu-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 15px;
        }

        .menu-item h3 {
            font-size: 22px;
            color: #fff;
            margin-bottom: 10px;
        }

        .menu-item p {
            font-size: 14px;
            color: #ccc;
            margin-bottom: 10px;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            color: #FF3C00;
        }

        .quantity-adjuster {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 15px 0;
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

        .add-to-cart-btn {
            margin-top: 10px;
            background-color: #FF3C00;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease;
            width: 100%;
        }

        .add-to-cart-btn:hover {
            background-color: #FFA500;
        }

        .out-of-stock {
            color: #FF3C00;
            font-weight: bold;
            margin-top: 10px;
            text-align: center;
        }

        .footer {
            background-color: #1e1e1e;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
            color: #ccc;
        }

        @media screen and (min-width: 1280px) and (max-width: 1920px) {
            .section-title {
                font-size: 40px;
            }

            .menu-item {
                padding: 25px;
                max-width: 350px;
            }

            .menu-item img {
                height: 220px;
            }

            .menu-item h3 {
                font-size: 24px;
            }

            .menu-item p {
                font-size: 16px;
            }

            .price {
                font-size: 20px;
            }

            .add-to-cart-btn {
                font-size: 16px;
                padding: 12px 24px;
            }
        }
    </style>
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
            <div class="menu-item">
                <img src="${not empty food.imagePath ? food.imagePath : 'images/default-food.jpg'}" 
                     alt="${food.foodName}" loading="lazy">
                <h3>${food.foodName}</h3>
                <p>${not empty food.foodDescription ? food.foodDescription : 'Delicious food item'}</p>
                <span class="price">$${String.format("%.2f", food.foodPrice)}</span>
                
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="foodId" value="${food.foodId}">
                    <input type="hidden" name="foodName" value="${food.foodName}">
                    <input type="hidden" name="price" value="${food.foodPrice}">
                    
                    <div class="quantity-adjuster">
                        <button type="button" class="quantity-btn minus">-</button>
                        <input type="number" name="quantity" value="1" min="1" max="${food.quantity}" 
                               class="quantity-input">
                        <button type="button" class="quantity-btn plus">+</button>
                    </div>
                    
                    <c:choose>
                        <c:when test="${food.quantity > 0}">
                            <button type="submit" class="add-to-cart-btn">
                                Add to Cart
                            </button>
                        </c:when>
                        <c:otherwise>
                            <div class="out-of-stock">Out of Stock</div>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </c:forEach>
    </div>
</section>

<footer class="footer">
    <p>&copy; 2025 Grab & Go. All rights reserved.</p>
</footer>

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

</body>
</html>