<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" type="text/css" href="css/search-results.css">
</head>
<body>
    <div class="container">
    <br>
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
                <p>No food items found for"<strong>${searchKeyword}</strong>".</p>
            </c:otherwise>
        </c:choose>
    </div>
    
</body>
</html>
