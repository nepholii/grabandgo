<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>View Staff</title>
  <link rel="stylesheet" type="text/css" href="css/viewStaff.css">
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
