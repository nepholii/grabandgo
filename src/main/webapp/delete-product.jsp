<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Food" %>
<%@ page import="DAO.FoodDAO" %>

<%
    FoodDAO foodDAO = new FoodDAO();
    List<Food> foodList = null;
    try {
        foodList = foodDAO.getAllAvailableFoodItems();
    } catch (Exception e) {
        e.printStackTrace();
    }
    request.setAttribute("foodList", foodList);
%>

<jsp:include page="admin-header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Delete Food Items</title>
   <link rel="stylesheet" type="text/css" href="css/delete-product.css">
</head>
<body>

<c:if test="${not empty sessionScope.message}">
    <p style="color: var(--primary); text-align: center;">${sessionScope.message}</p>
    <c:remove var="message" scope="session"/>
</c:if>

<h2>Delete Food Items</h2>

<c:choose>
    <c:when test="${empty foodList}">
        <p class="no-records">No food items found.</p>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
                <tr>
                    <th>Food ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Preparation Time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="food" items="${foodList}">
                    <tr>
                        <td>${food.foodId}</td>
                        <td>${food.foodName}</td>
                        <td>${food.foodDescription}</td>
                        <td>$${food.foodPrice}</td>
                        <td>${food.category}</td>
                        <td>${food.quantity}</td>
                        <td>${food.preparationTime}</td>
                        <td>
                            <form action="DeleteFoodServlet" method="post"
                                  onsubmit="return confirm('Are you sure you want to delete ${food.foodName}?');">
                                <input type="hidden" name="foodId" value="${food.foodId}" />
                                <button type="submit" class="delete-button">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>
