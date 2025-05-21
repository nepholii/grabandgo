<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="admin-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Product</title>
  	<link rel="stylesheet" type="text/css" href="css/manage-products.css">
</head>
<body>

<div class="grid-wrapper">
    <div class="grid-row">
        <!-- Create Product -->
        <a href="create-product.jsp" class="grid-card">
            <div class="emoji-icon">➕📦</div>
            <h2>Create Product</h2>
        </a>

        <!-- View Product -->
        <a href="view-product" class="grid-card">
            <div class="emoji-icon">👁️</div>
            <h2>View Product</h2>
        </a>
    </div>

    <div class="grid-row">
        <!-- Update Product -->
        <a href="update-product.jsp" class="grid-card">
            <div class="emoji-icon">🛠️</div>
            <h2>Update Product</h2>
        </a>

        <!-- Delete Product -->
        <a href="delete-product.jsp" class="grid-card">
            <div class="emoji-icon">🗑️</div>
            <h2>Delete Product</h2>
        </a>
    </div>
</div>

</body>
</html>
