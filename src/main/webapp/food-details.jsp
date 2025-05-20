<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${food.foodName} - Grab & Go</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
	    display: flex;
	    justify-content: center; 
	    align-items: center;    
	    min-height: 100vh;   
	    padding: 20px 40px;   /* more horizontal padding */
	    background-color: #121212;
	    font-family: 'Segoe UI', sans-serif;
	    color: #fff;
	    margin: 0;
	}
	
		.item-container {
	    max-width: 1100px;
	    margin: 40px auto;
	    display: flex;
	    background-color: #1e1e1e;
	    border-radius: 12px;
	    overflow: hidden;
	    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
	    width: 100%;
	    height: 400px;       /* FIXED height to make all cards equal */
	}
	
	.item-img {
	    width: 50%;
	    height: 100%;        /* full height of container */
	    object-fit: cover;   /* crop or scale image nicely */
	}
	
	.item-details {
	    padding: 40px;
	    flex: 1;
	    display: flex;
	    flex-direction: column;
	    justify-content: space-between; /* space between text & form */
	    overflow: hidden;
	}
	
	.item-details h1 {
	    font-size: 36px;
	    margin-bottom: 15px;
	    color: #FFCC00;
	    white-space: nowrap;         /* prevent wrapping */
	    overflow: hidden;
	    text-overflow: ellipsis;     /* truncate long titles */
	}
	
	.item-details p {
	    font-size: 16px;
	    margin-bottom: 20px;
	    color: #ccc;
	    line-height: 1.5;
	    overflow: hidden;
	    display: -webkit-box;
	    -webkit-line-clamp: 5;       /* limit description lines */
	    -webkit-box-orient: vertical;
	}
	
	.price {
	    font-size: 24px;
	    color: #FF3C00;
	    margin-bottom: 20px;
	    font-weight: bold;
	}
	
	.quantity {
	    margin-bottom: 20px;
	}
	
	.quantity label {
	    font-size: 16px;
	    margin-right: 10px;
	}
	
	.quantity input {
	    width: 60px;
	    text-align: center;
	    padding: 6px;
	    font-size: 16px;
	    border-radius: 6px;
	    border: none;
	    outline: none;
	    background-color: #2a2a2a;
	    color: white;
	}
	
	.quantity input:focus {
	    border: 2px solid #FF3C00;
	    background-color: #3a3a3a;
	}
	
	.btn-add {
	    background-color: #FF3C00;
	    color: white;
	    border: none;
	    padding: 12px 25px;
	    font-size: 16px;
	    font-weight: bold;
	    border-radius: 6px;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	    width: fit-content;
	}
	
	.btn-add:hover {
	    background-color: #FFA500;
	}
	
	@media (max-width: 768px) {
	    .item-container {
	        flex-direction: column;
	        max-width: 90%;
	        margin: 40px auto;
	        height: auto;  /* allow height to adjust on mobile */
	    }
	    .item-img {
	        width: 100%;
	        max-height: 300px;
	        height: auto;
	    }
	    .item-details {
	        padding: 20px;
	    }
	}

    </style>
</head>
<body>

<div class="item-container">
    <img src="${food.imagePath}" alt="${food.foodName}" class="item-img" />
    <div class="item-details">
        <h1>${food.foodName}</h1>
        <p>${food.foodDescription}</p>
        <div class="price">$${food.foodPrice}</div>

        <form action="cart" method="post">
            <input type="hidden" name="action" value="add" />
            <input type="hidden" name="foodId" value="${food.foodId}" />
            <input type="hidden" name="foodName" value="${food.foodName}" />
            <input type="hidden" name="price" value="${food.foodPrice}" />

            <div class="quantity">
                <label for="qty">Quantity:</label>
                <input type="number" id="qty" name="quantity" value="1" min="1" max="${food.quantity}" />
            </div>

            <button type="submit" class="btn-add">Add to Cart</button>
        </form>
    </div>
</div>

</body>
</html>
