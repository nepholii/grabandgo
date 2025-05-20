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
    <style>
        :root {
            --primary: #E2725B;
            --secondary: #F5F5DC;
            --accent1: #A0522D;
            --accent2: #FFDAB9;
            --bg-light: #FFF5E9;
            --danger: #D94F4F;
            --danger-hover: #B03B3B;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--secondary);
            padding: 40px;
            color: var(--accent1);
            margin: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 16px rgba(160, 82, 45, 0.15);
        }

        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid var(--accent2);
        }

        th {
            background-color: var(--primary);
            color: white;
            font-weight: 700;
            letter-spacing: 0.05em;
        }

        tr:hover {
            background-color: var(--bg-light);
        }

        .delete-button {
            background-color: var(--danger);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 700;
            transition: background-color 0.3s ease;
        }

        .delete-button:hover {
            background-color: var(--danger-hover);
        }

        h2 {
            text-align: center;
            color: var(--primary);
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 2rem;
            letter-spacing: 0.08em;
        }

        .no-records {
            text-align: center;
            color: var(--accent1);
            font-weight: 600;
            padding: 20px;
        }

        @media screen and (max-width: 600px) {
            table, th, td {
                font-size: 0.9rem;
            }
            h2 {
                font-size: 1.6rem;
            }
        }
    </style>
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
