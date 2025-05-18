<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${food.foodName}</title>
 <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background-color: #121212;
        font-family: 'Segoe UI', sans-serif;
        color: #fff;
        line-height: 1.6;
    }

		   .html, body {
	    height: 100%;
	    margin: 0;
	    padding: 0;
	    overflow: hidden; /* Prevent scrolling */
	    background-color: #121212;
	    font-family: 'Segoe UI', sans-serif;
	    color: #fff;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.detail-container {
	    width: 90%;
	    max-width: 500px;
	    padding: 24px;
	    background-color: #1e1e1e;
	    border-radius: 16px;
	    box-shadow: 0 0 20px rgba(255, 60, 0, 0.15);
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    gap: 20px;
	}


    .detail-container:hover {
        box-shadow: 0 6px 30px rgba(255, 60, 0, 0.3);
    }

    .food-image {
        width: 100%;
        max-width: 600px;
        height: auto;
        max-height: 400px;
        object-fit: cover;
        border-radius: 12px;
        margin-bottom: 24px;
        transition: transform 0.3s ease;
    }

    .food-image:hover {
        transform: scale(1.02);
    }

    .food-name {
        font-size: 2.25rem;
        color: #FFCC00;
        text-align: center;
        margin-bottom: 12px;
        font-weight: 600;
    }

    .food-description {
        font-size: 1.1rem;
        color: #ccc;
        text-align: center;
        margin-bottom: 20px;
        padding: 0 12px;
    }

    .food-price {
        font-size: 1.5rem;
        color: #4CAF50;
        font-weight: bold;
        margin-bottom: 28px;
    }

    .form-wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
    }

    .quantity {
        font-size: 1rem;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .quantity input {
        width: 70px;
        padding: 8px;
        font-size: 1rem;
        border-radius: 6px;
        border: 1px solid #444;
        background-color: #2a2a2a;
        color: white;
        text-align: center;
        transition: border-color 0.2s;
    }

    .quantity input:focus {
        border-color: #FF3C00;
        outline: none;
    }

    .btn-add {
        padding: 12px 28px;
        background-color: #FF3C00;
        border: none;
        color: white;
        font-size: 1rem;
        font-weight: bold;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s;
    }

    .btn-add:hover {
        background-color: #FFA500;
        transform: scale(1.05);
    }

    @media (max-width: 600px) {
        .food-name {
            font-size: 1.75rem;
        }

        .food-description {
            font-size: 1rem;
        }

        .food-price {
            font-size: 1.25rem;
        }
    }
</style>

</head>
<body>
    <div class="detail-container">
        <img src="${food.imagePath}" alt="${food.foodName}" class="food-image" />
        <div class="food-name">${food.foodName}</div>
        <div class="food-description">${food.foodDescription}</div>
        <div class="food-price">$${food.foodPrice}</div>

        <form action="cart" method="post">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="foodId" value="${food.foodId}">
    <input type="hidden" name="foodName" value="${food.foodName}">
    <input type="hidden" name="price" value="${food.foodPrice}">

    <div class="quantity">
        Quantity:
        <input type="number" name="quantity" value="1" min="1" max="${food.quantity}">
    </div>

    <button type="submit" class="btn-add">Add to Cart</button>
</form>
    </div>
</body>
</html>
