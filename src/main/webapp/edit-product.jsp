<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update Product</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #F5F5DC;
      margin: 0;
      padding: 0;
      color: #333;
    }

    .container {
      width: 80%;
      margin: 40px auto;
      background-color: white;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(160, 82, 45, 0.2);
    }

    h2 {
      text-align: center;
      color: #E2725B;
      margin-bottom: 30px;
      font-size: 32px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 16px;
    }

    label {
      font-weight: bold;
      margin-bottom: 4px;
      color: #A0522D;
    }

    input[type="text"],
    input[type="number"],
    textarea {
      padding: 10px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      background-color: #FFF8F0;
    }

    textarea {
      resize: vertical;
    }

    button {
      padding: 12px;
      font-size: 16px;
      background-color: #A0522D;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      margin-top: 10px;
      width: 200px;
      align-self: center;
    }

    button:hover {
      background-color: #8B4513;
    }

    .form-group {
      display: flex;
      flex-direction: column;
    }

    .back-link {
      text-align: center;
      margin-top: 20px;
    }

    .back-link a {
      text-decoration: none;
      color: #E2725B;
      font-weight: bold;
    }
  </style>
</head>
<body>

<jsp:include page="admin-header.jsp" />

<div class="container">
  <h2>Update Product Information</h2>

  <form action="UpdateProductServlet" method="post">
    <input type="hidden" name="foodId" value="${food.foodId}" />

    <div class="form-group">
      <label for="foodName">Food Name:</label>
      <input type="text" id="foodName" name="foodName" value="${food.foodName}" required />
    </div>

    <div class="form-group">
      <label for="foodDescription">Description:</label>
      <textarea id="foodDescription" name="foodDescription" rows="4">${food.foodDescription}</textarea>
    </div>

    <div class="form-group">
      <label for="foodPrice">Price ($):</label>
      <input type="number" id="foodPrice" name="foodPrice" step="0.01" value="${food.foodPrice}" required />
    </div>

    <div class="form-group">
      <label for="category">Category:</label>
      <input type="text" id="category" name="category" value="${food.category}" />
    </div>

    <div class="form-group">
      <label for="quantity">Quantity:</label>
      <input type="number" id="quantity" name="quantity" value="${food.quantity}" />
    </div>

    <div class="form-group">
      <label for="preparationTime">Preparation Time:</label>
      <input type="text" id="preparationTime" name="preparationTime" value="${food.preparationTime}" />
    </div>

    <div class="form-group">
      <label for="imagePath">Image Path:</label>
      <input type="text" id="imagePath" name="imagePath" value="${food.imagePath}" />
    </div>

    <button type="submit">Update Product</button>
  </form>

 
</div>

</body>
</html>
