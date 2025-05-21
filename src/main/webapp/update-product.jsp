<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List,DAO.FoodDAO,Model.Food" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    FoodDAO foodDAO = new FoodDAO();
    List<Food> foodList = foodDAO.getAllAvailableFoodItems();
    request.setAttribute("foodList", foodList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update Products</title>
  <link rel="stylesheet" type="text/css" href="css/update-product.css">
</head>
<body>

<jsp:include page="admin-header.jsp" />

<div class="container">
  <h2>Available Food Items</h2>

  <c:choose>
    <c:when test="${empty foodList}">
      <p style="text-align:center; color:#A0522D; font-weight:bold; margin-top:20px;">
        No food items available.
      </p>
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
            <th>Image</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="food" items="${foodList}">
            <tr>
              <td data-label="Food ID">${food.foodId}</td>
              <td data-label="Name">${food.foodName}</td>
              <td data-label="Description">${food.foodDescription}</td>
              <td data-label="Price">$ ${food.foodPrice}</td>
              <td data-label="Category">${food.category}</td>
              <td data-label="Quantity">${food.quantity}</td>
              <td data-label="Preparation Time">${food.preparationTime}</td>
              <td data-label="Image">
                <c:choose>
                  <c:when test="${not empty food.imagePath}">
                    <img src="${food.imagePath}" alt="${food.foodName}" class="food-image" loading="lazy" />
                  </c:when>
                  <c:otherwise>
                    <img src="images/default-food.jpg" alt="Default Food" class="food-image" loading="lazy" />
                  </c:otherwise>
                </c:choose>
              </td>
              <td data-label="Action">
                <form action="UpdateProductServlet" method="get">
                  <input type="hidden" name="foodId" value="${food.foodId}" />
                  <button type="submit" class="update-button">Update</button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>
</div>

</body>
</html>
