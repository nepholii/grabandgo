<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-header.jsp" %>

<html>
<head>
    <title>Create Product</title>
    <link rel="stylesheet" type="text/css" href="css/create-product.css">
</head>
<body>
<br><br><br><br>

<!-- Display success or error message using URL parameter -->
<c:if test="${param.status == 'success'}">
    <div class="success-message">Product created successfully!</div>
</c:if>
<c:if test="${param.status == 'error'}">
    <div class="error-message">Error occurred while creating the product.</div>
</c:if>

<form action="CreateProductServlet" method="post" enctype="multipart/form-data">
    <h2>Create New Product</h2>

    <label for="food_name">Food Name</label>
    <input type="text" name="food_name" id="food_name" required>

    <label for="food_description">Description</label>
    <textarea name="food_description" id="food_description" required></textarea>

    <label for="food_price">Price</label>
    <input type="number" name="food_price" id="food_price" step="0.01" required>

    <label for="category">Category</label>
    <select name="category" id="category" required>
        <option value="">-- Select Category --</option>
        <option value="Main Course">Main Course</option>
        <option value="Dessert">Dessert</option>
        <option value="Appetizer">Appetizer</option>
        <option value="Beverage">Beverage</option>
        <option value="Salad">Salad</option>
        <option value="Soup">Soup</option>
    </select>

    <label for="quantity">Quantity</label>
    <input type="number" name="quantity" id="quantity" required>

    <label for="preparation_time">Preparation Time (minutes)</label>
    <input type="number" name="preparation_time" id="preparation_time" required>

    <label for="image">Image</label>
    <input type="file" name="image" id="image" accept="image/*" required>

    <input type="submit" value="Create Product">
</form>

</body>
</html>
