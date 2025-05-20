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
  <style>
  body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #F5F5DC;
  margin: 0;
  padding: 0;
  color: #333;
}

.container {
  width: 90%;
  max-width: 1200px;
  margin: 40px auto 60px auto;
  background-color: white;
  border-radius: 15px;
  box-shadow: 0 6px 20px rgba(160, 82, 45, 0.2);
  padding: 30px 20px;
  box-sizing: border-box;
}

h2 {
  text-align: center;
  color: #E2725B;
  font-weight: 700;
  font-size: 32px;
  letter-spacing: 1.2px;
  margin-bottom: 25px;
}

table {
  width: 100%;
  border-collapse: separate;
  border-spacing: 0;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 6px 20px rgba(160, 82, 45, 0.15);
}

thead tr {
  background-color: #E2725B;
  color: white;
  font-weight: 700;
  font-size: 16px;
  letter-spacing: 0.8px;
}

th, td {
  padding: 18px;
  text-align: left;
  border-bottom: 1px solid #FFDAB9;
  vertical-align: middle;
}

tbody tr {
  height: 150px;
}

tbody tr:nth-child(even) {
  background-color: #FFF1E6;
}

tbody tr:hover {
  background-color: #FFDAB9;
  cursor: pointer;
}

.food-image {
  width: 120px;
  height: 120px;
  object-fit: cover;
  border-radius: 12px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.food-image:hover {
  transform: scale(1.5);
  z-index: 999;
  position: relative;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
}

.update-button {
  padding: 8px 14px;
  font-size: 14px;
  background-color: #A0522D;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.update-button:hover {
  background-color: #8B4513;
}

/* Responsive styles for mobile */
@media screen and (max-width: 768px) {
  table, thead, tbody, th, td, tr {
    display: block;
  }

  thead tr {
    display: none;
  }

  tbody tr {
    margin-bottom: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(160, 82, 45, 0.15);
    padding: 15px;
    background-color: white !important;
  }

  tbody td {
    text-align: right;
    padding-left: 50%;
    position: relative;
    border-bottom: 1px solid #FFDAB9;
  }

  tbody td::before {
    content: attr(data-label);
    position: absolute;
    left: 15px;
    width: 45%;
    padding-left: 10px;
    font-weight: 700;
    text-align: left;
    color: #A0522D;
  }
}
  </style>
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
