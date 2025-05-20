<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="admin-header.jsp" %>

<html>
<head>
    <title>Create Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }

        form {
            width: 60%;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: 600;
            color: #444444;
        }

        /* Specific style for category label */
        label[for="category"] {
            
            font-weight: 600;
            font-size: 16px;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        textarea,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 10px;
            font-size: 15px;
            box-sizing: border-box;
            background-color: #FFF8F0;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        select#category {
            background-color: #FFF8F0;
            color: #333;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #E2725B;
            color: #fff;
            padding: 14px;
            margin-top: 25px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #d15a45;
        }

        .success-message, .error-message {
            width: 60%;
            margin: 20px auto;
            padding: 15px;
            border-radius: 10px;
            font-weight: bold;
            text-align: center;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
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
