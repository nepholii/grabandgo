<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update Product</title>
  <link rel="stylesheet" type="text/css" href="css/edit-product.css">
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
      <select id="category" name="category" required>
        <option value="">-- Select Category --</option>
        <option value="Main Course" ${food.category == 'Main Course' ? 'selected' : ''}>Main Course</option>
        <option value="Dessert" ${food.category == 'Dessert' ? 'selected' : ''}>Dessert</option>
        <option value="Appetizer" ${food.category == 'Appetizer' ? 'selected' : ''}>Appetizer</option>
        <option value="Beverage" ${food.category == 'Beverage' ? 'selected' : ''}>Beverage</option>
        <option value="Salad" ${food.category == 'Salad' ? 'selected' : ''}>Salad</option>
        <option value="Soup" ${food.category == 'Soup' ? 'selected' : ''}>Soup</option>
      </select>
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
