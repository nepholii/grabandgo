<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%
    // Retrieving the item details from the query parameters
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String desc = request.getParameter("desc");
    String image = request.getParameter("image");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= name %> - Grab & Go</title>
  <link rel="stylesheet" type="text/css" href="css/item-details.css">
</head>
<body>

<div class="item-container">
    <img src="<%= image %>" alt="<%= name %>" class="item-img">
    <div class="item-details">
        <h1><%= name %></h1>
        <p><%= desc %></p>
        <div class="price">$<%= price %></div>

        <div class="quantity">
            <label for="qty">Quantity:</label>
            <input type="number" id="qty" name="qty" value="1" min="1">
        </div>

        <button class="btn" onclick="addToCart()">Add to Cart</button>
        <button class="btn" onclick="placeOrder()">Place Order</button>
    </div>
</div>



</body>
</html>