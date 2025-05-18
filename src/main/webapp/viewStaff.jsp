<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>View Staff</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #F5F5DC; /* Creamy Beige */
      margin: 0;
      padding: 0;
      color: #333;
    }

    .container {
      width: 90%;
      margin: 40px auto 60px auto;
      background-color: white;
      border-radius: 15px;
      box-shadow: 0 6px 20px rgba(160, 82, 45, 0.2); /* Toasted Brown shadow */
      padding: 30px 20px;
      box-sizing: border-box;
    }

    h2 {
      text-align: center;
      color: #E2725B; /* Warm Terracotta */
      font-weight: 700;
      font-size: 32px;
      letter-spacing: 1.2px;
      margin-bottom: 25px;
    }

    table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 6px 20px rgba(160, 82, 45, 0.15);
    }

    thead tr {
      background-color: #E2725B; /* Warm Terracotta */
      color: white;
      font-weight: 700;
      font-size: 16px;
      letter-spacing: 0.8px;
    }

    th, td {
      padding: 14px 18px;
      text-align: left;
      border-bottom: 1px solid #FFDAB9; /* Soft Peach */
    }

    tbody tr:nth-child(even) {
      background-color: #FFF1E6; /* Very light peach */
    }

    tbody tr:hover {
      background-color: #FFDAB9; /* Soft Peach */
      cursor: pointer;
    }

    /* Responsive */
    @media screen and (max-width: 768px) {
      table, thead, tbody, th, td, tr {
          display: block;
      }
      thead tr {
          display: none;
      }
      tbody tr {
          margin-bottom: 20px;
          border-radius: 12px;
          box-shadow: 0 4px 15px rgba(160, 82, 45, 0.15);
          padding: 15px;
          background-color: white !important;
      }
      tbody td {
          text-align: right;
          padding-left: 50%;
          position: relative;
          border-bottom: 1px solid #FFDAB9;
      }
      tbody td::before {
          content: attr(data-label);
          position: absolute;
          left: 15px;
          width: 45%;
          padding-left: 10px;
          font-weight: 700;
          text-align: left;
          color: #A0522D; /* Toasted Brown */
      }
    }
  </style>
</head>
<body>

<jsp:include page="admin-header.jsp" />

<div class="container">
  <h2>Staff List</h2>

  <c:choose>
    <c:when test="${empty staffList}">
      <p style="text-align:center; color:#A0522D; font-weight:bold; margin-top:20px;">
        No staff records found.
      </p>
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
          </tr>
        </thead>
        <tbody>
          <c:forEach var="staff" items="${staffList}">
            <tr>
              <td data-label="Staff ID">${staff.staffId}</td>
              <td data-label="Name">${staff.firstName} ${staff.lastName}</td>
              <td data-label="Username">${staff.username}</td>
              <td data-label="Phone">${staff.phone}</td>
              <td data-label="Email">${staff.email}</td>
              <td data-label="Gender">${staff.gender}</td>
              <td data-label="Salary">${staff.salary}</td>
              <td data-label="Shift">${staff.shift}</td>
              <td data-label="Hire Date">${staff.hireDate}</td>
              <td data-label="Job Title">${staff.jobTitle}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>
</div>

</body>
</html>
