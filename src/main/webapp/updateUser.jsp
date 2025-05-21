<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.User" %>
<%@ page import="DAO.UserDAO" %>

<%
    UserDAO userDAO = new UserDAO();
    List<User> userList = userDAO.getUsersByRole("Customer");
    request.setAttribute("userList", userList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update User</title>
  <link rel="stylesheet" type="text/css" href="css/updateUser.css">
</head>
<body>

<jsp:include page="admin-header.jsp" />
<br>

<div class="container">
  <h2>Update User Information</h2>

  <c:choose>
    <c:when test="${empty userList}">
      <p class="no-records">No user records found.</p>
    </c:when>
    <c:otherwise>
      <table>
        <thead>
          <tr>
            <th>User ID</th>
            <th>Name</th>
            <th>Username</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Action</th> <!-- Added Action column -->
          </tr>
        </thead>
        <tbody>
          <c:forEach var="user" items="${userList}">
            <tr>
              <td data-label="User ID">${user.id}</td>
              <td data-label="Name">${user.firstName} ${user.lastName}</td>
              <td data-label="Username">${user.username}</td>
              <td data-label="Phone">${user.phone}</td>
              <td data-label="Email">${user.email}</td>
              <td data-label="Gender">${user.gender}</td>
              <td data-label="Address">${user.address}</td>
              <td data-label="Action">
                <form action="editUser.jsp" method="get" class="update-form">
                  <input type="hidden" name="userId" value="${user.id}" />
                  <button type="submit">Update</button>
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
