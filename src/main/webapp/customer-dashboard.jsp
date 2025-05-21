<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Grab & Go – Order Your Favorite Meal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/customer-dashboard.css">
 
</head>
<body>

<section class="hero" id="home"
	style="background-image: url('${pageContext.request.contextPath}/images/herofood.png');">
    <div class="hero-overlay"></div>
    <div class="hero-content">
        <h1>Satisfy Your Cravings,</h1>
        <p>Order Online, Grab Hot and Fresh!</p>
        <a href="MenuServlet" class="hero-btn">Browse Menu</a>
    </div>
</section>

<section class="featured-menu">
    <h2 class="section-title">Today's Special</h2>
    <div class="menu-grid">
        <a href="item-details.jsp?name=Spicy%20Wings&price=8&desc=Hot%20and%20spicy%20chicken%20wings%20with%20ranch%20dip.&image=images/spicy%20wings.jpg" class="menu-item">
            <img src="images/spicywings.jpg" alt="Spicy Wings">
            <h3>Spicy Wings</h3>
            <p>Hot and spicy chicken wings with ranch dip.</p>
            <span class="price">$8</span>
        </a>

        <a href="item-details.jsp?name=Loaded%20Nachos&price=6&desc=Crispy%20nachos%20loaded%20with%20cheese%20and%20jalape%C3%B1os.&image=images/loaded-nachos.jpg" class="menu-item">
            <img src="images/loaded-nachos.jpg" alt="Loaded Nachos"> 
            <h3>Loaded Nachos</h3>
            <p>Crispy nachos loaded with cheese and jalapeños.</p>
            <span class="price">$6</span>
        </a>

        <a href="item-details.jsp?name=Choco%20Blast&price=4&desc=A%20rich%20chocolate%20dessert%20to%20end%20your%20meal%20perfectly.&image=images/choco-blast.jpg" class="menu-item">
            <img src="images/choco-blast.jpg" alt="Choco Blast Dessert">
            <h3>Choco Blast</h3>
            <p>A rich chocolate dessert to end your meal perfectly.</p>
            <span class="price">$4</span>
        </a>
    </div>
</section>

<section class="featured-menu">
    <h2 class="section-title">Fan Favorites</h2>
    <div class="menu-grid">
        <a href="item-details.jsp?name=Classic%20Burger&price=6&desc=Juicy%20grilled%20patty%20with%20fresh%20lettuce%20and%20cheese.&image=images/burger.jpg" class="menu-item">
            <img src="images/burger.jpg" alt="Classic Burger">
            <h3>Classic Burger</h3>
            <p>Juicy grilled patty with fresh lettuce and cheese.</p>
            <span class="price">$6</span>
        </a>

        <a href="item-details.jsp?name=Crispy%20Fries&price=2&desc=Golden%2C%20crunchy%20fries%20perfectly%20salted.&image=images/fries.jpg" class="menu-item">
            <img src="images/fries.jpg" alt="Crispy Fries">
            <h3>Crispy Fries</h3>
            <p>Golden, crunchy fries perfectly salted.</p>
            <span class="price">$2</span>
        </a>

        <a href="item-details.jsp?name=Combo%20Meal&price=9&desc=Burger%2C%20fries%2C%20and%20drink%20%E2%80%93%20the%20ultimate%20combo.&image=images/combo.jpg" class="menu-item">
            <img src="images/combo.jpg" alt="Combo Meal">
            <h3>Combo Meal</h3>
            <p>Burger, fries, and drink — the ultimate combo.</p>
            <span class="price">$9</span>
        </a>
    </div>
</section>

<section class="featured-menu">
    <h2 class="section-title">Chef’s Specials</h2>
    <div class="menu-grid">
        <a href="item-details.jsp?name=Spicy%20Wings&price=8&desc=Hot%20and%20spicy%20chicken%20wings%20with%20ranch%20dip.&image=images/spicy%20wings.jpg" class="menu-item">
            <img src="images/spicywings.jpg" alt="Spicy Wings">
            <h3>Spicy Wings</h3>
            <p>Hot and spicy chicken wings with ranch dip.</p>
            <span class="price">$8</span>
        </a>

        <a href="item-details.jsp?name=Loaded%20Nachos&price=6&desc=Crispy%20nachos%20loaded%20with%20cheese%20and%20jalape%C3%B1os.&image=images/loaded-nachos.jpg" class="menu-item">
            <img src="images/loaded-nachos.jpg" alt="Loaded Nachos">
            <h3>Loaded Nachos</h3>
            <p>Crispy nachos loaded with cheese and jalapeños.</p>
            <span class="price">$6</span>
        </a>

        <a href="item-details.jsp?name=Choco%20Blast&price=4&desc=A%20rich%20chocolate%20dessert%20to%20end%20your%20meal%20perfectly.&image=images/choco-blast.jpg" class="menu-item">
            <img src="images/choco-blast.jpg" alt="Choco Blast Dessert">
            <h3>Choco Blast</h3>
            <p>A rich chocolate dessert to end your meal perfectly.</p>
            <span class="price">$4</span>
        </a>
    </div>
</section>



</body>
</html>

