<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
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
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
        }

        h2 {
            color: #FF3C00;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .food-card {
            background-color: #1e1e1e;
            border: 1px solid #333;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            gap: 20px;
            box-shadow: 0 0 10px rgba(255, 60, 0, 0.2);
        }

        .food-image {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 10px;
            border: 2px solid #444;
        }

        .food-info {
            flex-grow: 1;
        }

        .food-name {
            font-size: 20px;
            color: #FFCC00;
            margin-bottom: 10px;
        }

        .food-description {
            font-size: 14px;
            color: #ccc;
        }

        .food-price {
            font-size: 16px;
            font-weight: bold;
            color: #4CAF50;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Search Results for "<c:out value='${searchKeyword}'/>"</h2>

        <c:choose>
            <c:when test="${not empty searchResults}">
                <c:forEach var="food" items="${searchResults}">
                    <a href="FoodDetailsServlet?foodId=${food.foodId}" style="text-decoration: none; color: inherit;">
				    <div class="food-card">
				        <img src="${food.imagePath}" class="food-image" alt="${food.foodName}">
				        <div class="food-info">
				            <div class="food-name">${food.foodName}</div>
				            <div class="food-description">${food.foodDescription}</div>
				            <div class="food-price">$${food.foodPrice}</div>
				        </div>
				    </div>
				</a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>No food items found for "<strong>${searchKeyword}</strong>".</p>
            </c:otherwise>
        </c:choose>
    </div>
    
</body>
</html>
