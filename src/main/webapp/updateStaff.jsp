<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Staff" %>
<%@ page import="DAO.StaffDAO" %>

<%
    StaffDAO staffDAO = new StaffDAO();
    List<Staff> staffList = staffDAO.getAllStaff();
    request.setAttribute("staffList", staffList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update Staff</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #F5F5DC; /* Creamy Beige */
      margin: 0;
      padding: 0;
      color: #333;
    }

    .container {
      width: 100%;
      padding: 40px 20px;
      background: #F5F5DC;
      min-height: 100vh;
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      color: #E2725B; /* Warm Terracotta */
      font-size: 32px;
      margin-bottom: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 6px 20px rgba(160, 82, 45, 0.2); /* Toasted Brown shadow */
    }

    th, td {
      padding: 14px 18px;
      text-align: center;
      border-bottom: 1px solid #FFDAB9; /* Soft Peach */
    }

    th {
      background-color: #E2725B; /* Warm Terracotta */
      color: white;
      font-weight: bold;
    }

    tbody tr:nth-child(even) {
      background-color: #FFF1E6; /* Very light peach */
    }

    tbody tr:hover {
      background-color: #FFDAB9; /* Soft Peach */
    }

    .update-button {
      padding: 8px 16px;
      font-size: 14px;
      background-color: #A0522D; /* Toasted Brown */
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .update-button:hover {
      background-color: #8B4513; /* Darker brown */
    }

    .no-records {
      text-align: center;
      color: #A0522D;
      margin-top: 20px;
      font-weight: bold;
    }
  </style>
</head>
<body>

<jsp:include page="admin-header.jsp" />
<br>

<div class="container">
  <h2>Update Staff Information</h2>

  <c:choose>
    <c:when test="${empty staffList}">
      <p class="no-records">No staff records found.</p>
    </c:when>
    <c:otherwise>
      <table>
        <thead>
          <tr>
            <th>Staff ID</th>
            <th>Name</th>
            <th>Username</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Gender</th>
            <th>Salary</th>
            <th>Shift</th>
            <th>Hire Date</th>
            <th>Job Title</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="staff" items="${staffList}">
            <tr>
              <td>${staff.staffId}</td>
              <td>${staff.firstName} ${staff.lastName}</td>
              <td>${staff.username}</td>
              <td>${staff.phone}</td>
              <td>${staff.email}</td>
              <td>${staff.gender}</td>
              <td>${staff.salary}</td>
              <td>${staff.shift}</td>
              <td>${staff.hireDate}</td>
              <td>${staff.jobTitle}</td>
              <td>
                <form action="editStaff.jsp" method="get">
                  <input type="hidden" name="staffId" value="${staff.staffId}" />
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
