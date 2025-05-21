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

<jsp:include page="admin-header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Delete Staff</title>
    <link rel="stylesheet" type="text/css" href="css/deleteStaff.css">
</head>
<body>

<c:if test="${not empty sessionScope.message}">
    <p style="color: var(--primary); text-align: center;">${sessionScope.message}</p>
    <c:remove var="message" scope="session"/>
</c:if>

<h2>Delete Staff Records</h2>

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
                            <form action="DeleteStaffServlet" method="post" onsubmit="return confirm('Are you sure you want to delete ${staff.firstName} ${staff.lastName}?');">
                                <input type="hidden" name="staffId" value="${staff.staffId}" />
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
